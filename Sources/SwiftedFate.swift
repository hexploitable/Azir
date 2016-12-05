import Foundation

public class SwiftedFate {
  
  public var apiKey: String
  public var region: Region
  
  public var summoner = _summoner()
  
  let rateLimiter: RateLimiter
  let session = URLSession()
  
  public init(apiKey: String, region: Region = .na, rateLimit: RateLimitOptions = RateLimitOptions(tenSLimit: 10, tenMLimit: 500)) {
    self.apiKey = apiKey
    self.region = region
    
    self.rateLimiter = RateLimiter(tenSLimit: rateLimit.tenSLimit, tenMLimit: rateLimit.tenMLimit)
    
    summoner.parent = self
  }
  
}
