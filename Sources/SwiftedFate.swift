import Foundation

public class SwiftedFate {
  
  public var apiKey: String
  public var region: Region
  
  public let summoner = SummonerEndpoint()
  
  #if !os(iOS)
    let rateLimiter: RateLimiter
  
    public init(apiKey: String, region: Region = .na, rateLimiter: RateLimiter = RateLimiter(tenSLimit: 10, tenMLimit: 500)) {
      self.apiKey = apiKey
      self.region = region
      self.rateLimiter = rateLimiter
    }
  #else
    public init(apiKey: String, region: Region = .na) {
      self.apiKey = apiKey
      self.region = region
    }
  #endif
  
}
