//
//  Utils.swift
//  Azir
//
//  Created by Alejandro Alonso
//  Copyright © 2017 Alejandro Alonso. All rights reserved.
//

public class Endpoint {

  var azir: Azir!

  func createUrl(endpoint: String, region: Region, platform: Bool = false, options: [String: String] = [:]) -> String {
    var url = "https://\(region.rawValue).api.riotgames.com\(endpoint)".replacingOccurrences(of: "region", with: region.rawValue)

    if platform {
      url = url.replacingOccurrences(of: "platform", with: region.platformId)
    }

    for (key, value) in options {
      url += "\(key)=\(value)&"
    }

    if url.characters[url.characters.index(before: url.characters.endIndex)] == "&" {
      url.remove(at: url.characters.endIndex)
    }

    return url
  }

}

public enum RequestError: Int {

  case badRequest = 400

  case unauthorized

  case notFound = 404

  case unsupportedMediaType = 415

  case rateLimited = 429

  case serverError = 500

  case serviceUnavailable = 503

  case unknown = 0

}

public enum Region: String {

  case br,
       eune,
       euw,
       jp,
       kr,
       lan,
       las,
       na,
       oce,
       tr,
       ru

  var platformId: String {
    switch self {
      case .kr, .ru:
        return self.rawValue.uppercased()
      case .eune, .lan, .oce:
        return self.rawValue.substring(to: self.rawValue.index(before: self.rawValue.endIndex)).uppercased() + "1"
      case .las:
        return "LA2"
      default:
        return self.rawValue.uppercased() + "1"
    }
  }

}
