//
//  Request.swift
//  SwiftedFate
//
//  Created by Azoy on 10/13/16.
//
//

import Foundation

internal extension SwiftedFate {

  struct Request {

    let apiKey: String
    let session = URLSession.shared

    init(apiKey: String) {
      self.apiKey = apiKey
    }

    func createUrl(base: String, region: Region, endpoint: String, options: [String: String] = [:]) -> String {
      var url = base.replacingOccurrences(of: "region", with: region.rawValue)
      
      if (options["platform"] == "true") {
        url = url.replacingOccurrences(of: "platform", with: convert(region: region))
      }
      
      url += "?"
      
      for (key, value) in options {
        url += "\(key)=\(value)&"
      }
      
      url += "api_key=\(self.apiKey)"
      
      return url.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)!
    }

    func get(url: String, completionHandler: ([String: Any]?, Response?) -> Void) {
      self.session.dataTask(with: URL(string: url)!) { data, response, error in
        
      }
    }

  }

}
