//
//  Errors.swift
//  SwiftedFate
//
//  Created by Alejandro Alonso on 7/9/16.
//  Copyright © 2016 Alejandro Alonso. All rights reserved.
//

import Foundation

//Errors
public extension SwiftedFate {
  
  public enum Error {
    case badRequest, unauthorized, notFound, unsupportedMediaType, rateLimitExceeded, serviceError, serviceUnavailable, unknown
  }
  
}

//Get status code of response, so I can spit out an error
internal extension NSHTTPURLResponse {
  
  func getSFError() -> SwiftedFate.Error {
    switch self.statusCode {
    case 400:
      return SwiftedFate.Error.badRequest
    case 401:
      return SwiftedFate.Error.unauthorized
    case 404:
      return SwiftedFate.Error.notFound
    case 415:
      return SwiftedFate.Error.unsupportedMediaType
    case 429:
      return SwiftedFate.Error.rateLimitExceeded
    case 500:
      return SwiftedFate.Error.serviceError
    case 503:
      return SwiftedFate.Error.serviceUnavailable
    default:
      return SwiftedFate.Error.unknown
    }
  }
  
}
