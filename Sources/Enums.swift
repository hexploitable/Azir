import Foundation

extension SwiftedFate {
  
  public enum Region: String {
    case br, eune, euw, jp, kr, lan, las, na, oce, tr, ru
    
    var platformId: String {
      switch self {
        case .kr, .ru:
          return self.rawValue.uppercased()
        case .eune, .oce:
          return self.rawValue.substring(to: self.rawValue.index(before: self.rawValue.endIndex)) + "1"
        case .las:
          return "LA2"
        default:
          return self.rawValue.uppercased() + "1"
      }
    }
  }
  
  public enum Error {
    case badRequest, unauthorized, notFound, unsupportedMediaType, rateLimitExceeded, internalError, serviceError, unknown
  }
  
}

extension HTTPURLResponse {
  
  func getAPIError() -> SwiftedFate.Error {
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
        return SwiftedFate.Error.internalError
      case 503:
        return SwiftedFate.Error.serviceError
      default:
        return SwiftedFate.Error.unknown
    }
  }
  
}
