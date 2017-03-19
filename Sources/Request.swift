//
//  Request.swift
//  Azir
//
//  Created by Alejandro Alonso
//  Copyright © 2017 Alejandro Alonso. All rights reserved.
//

import Foundation
import Dispatch

extension Azir {

  func globalUnlock() {
    self.globallyLocked = false
    for request in self.globalLockQueue {
      request()
    }
  }

  func request(_ url: String, method: String = "GET", rateLimited: Bool = true, region: Region, then completion: @escaping ([String: Any]?, RequestError?) -> ()) {
    let sema = DispatchSemaphore(value: 0)

    var urlRequest = URLRequest(url: URL(string: url)!)
    urlRequest.addValue(key, forHTTPHeaderField: "X-Riot-Token")

    let task = self.session.dataTask(with: urlRequest) { data, response, error in
      let response = response as! HTTPURLResponse
      let headers = response.allHeaderFields

      guard response.statusCode == 200 else {
        var status = RequestError(rawValue: response.statusCode)
        if status == nil {
          status = .unknown
        }

        if status == .rateLimited {
          let retryAfter = Int(headers["Retry-After"] as! String)!
          self.globallyLocked = true
          self.globalQueue.asyncAfter(deadline: DispatchTime.now() + .seconds(retryAfter), execute: self.globalUnlock)
        }

        completion(nil, status)
        sema.signal()
        return
      }

      if rateLimited {
        let rateLimit = (headers["X-App-Rate-Limit-Count"] as! String).components(separatedBy: ",")
        let firstLimit = rateLimit[0].components(separatedBy: ":")
        let secondLimit = rateLimit[1].components(separatedBy: ":")

        if self.rateLimits[region] == nil {
          let bucket = DualBucket(
            name: "gg.azoy.azir.\(region)",
            limit1: self.limit[0],
            interval1: Int(firstLimit[1])!,
            limit2: self.limit[1],
            interval2: Int(secondLimit[1])!
          )
          bucket.take(1)

          self.rateLimits[region] = bucket
        }else {
          let currentTokens1 = self.limit[0] - Int(firstLimit[0])!
          let currentTokens2 = self.limit[1] - Int(secondLimit[0])!

          if currentTokens1 != self.rateLimits[region]!.tokens1 {
            self.rateLimits[region]!.tokens1 = currentTokens1
          }

          if currentTokens2 != self.rateLimits[region]!.tokens2 {
            self.rateLimits[region]!.tokens2 = currentTokens2
          }
        }
      }

      do {
        let returnData = try JSONSerialization.jsonObject(with: data!, options: .allowFragments)
        if let dictionaryData = returnData as? [String: Any] {
          completion(dictionaryData, nil)
        }else {
          completion(["data": returnData], nil)
        }
      }catch {
        completion(nil, .unknown)
      }

    }

    let request = {
      if rateLimited && self.rateLimits[region] != nil {
        let item = DispatchWorkItem {
          task.resume()

          sema.wait()
        }
        self.rateLimits[region]!.queue(item)
      }else {
        task.resume()

        sema.wait()
      }
    }

    if self.globallyLocked {
      self.globalLockQueue.append(request)
    }else {
      request()
    }

  }

}
