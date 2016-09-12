//
//  Utility.swift
//  SwiftedFate
//
//  Created by Alejandro Alonso on 7/7/16.
//  Copyright © 2016 Alejandro Alonso. All rights reserved.
//

import Foundation

//Utility
internal extension SwiftedFate {
  
  /*
   @param base: String - The base url
   region: Region - The region to execute against
   endpoint: String - The specific call to make
   options: Dictionary<String, String> - Options to add to url
   platform: Region.Platform - The platform to execute against
   */
  internal func createUrl(base: String, region: Region, endpoint: String, options: [String: String] = [:], platform: Platform = .NA1) -> String {
    var url = base.replacingOccurrences(of: "region", with: region.rawValue)
    
    url = url.replacingOccurrences(of: "platform", with: platform.rawValue) + endpoint + "?"
    
    for (key, value) in options {
      url += key + "=" + value + "&"
    }
    
    url += "api_key=" + self.apiKey
    
    return url.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlFragmentAllowed)!
  }
  
  /*
   @param url: String - The url to get data from
   */
  internal func request(url: String, completion: @escaping (AnyObject?, Error?) -> Void) {
    let task = self.session.dataTask(with: URL(string: url)!) { (data, response, error) in
      let response = response as! HTTPURLResponse
      let statusCode = response.statusCode
      if error != nil {
        completion(nil, response.getSFError())
      }else {
        if (statusCode != 200) {
          completion(nil, response.getSFError())
        }else {
          do {
            let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments)
            completion(json as AnyObject?, nil)
          }catch {
            completion(nil, response.getSFError())
          }
        }
      }
    }
    
    task.resume()
  }
  
}
