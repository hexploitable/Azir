import Foundation

public extension SwiftedFate {
  
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
  
}
