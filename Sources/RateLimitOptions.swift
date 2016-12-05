import Foundation

#if !os(iOS)
  public struct RateLimitOptions {
    
    let tenSLimit: Int
    let tenMLimit: Int
    
    public init(tenSLimit: Int = 10, tenMLimit: Int = 500) {
      self.tenSLimit = tenSLimit
      self.tenMLimit = tenMLimit
    }
    
  }
#endif
