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

    init(apiKey: String) {
      self.apiKey = apiKey
    }

    func createUrl(base: String, region: Region, endpoint: String, options: [String: Any] = [:]) -> String {
      return ""
    }

    func get(url: String, completionHandler: ([String: Any]?, Error?) -> Void) {

    }

  }

}
