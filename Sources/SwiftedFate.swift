public struct SwiftedFate {
  
  public var region: Region
  
  let request: Request
  
  public let summoner: SummonerEndpoint
  
  public init(apiKey: String, region: Region = .na) {
    self.region = region
    
    self.request = Request(apiKey: apiKey)
    
    self.summoner = SummonerEndpoint(region: region, self.request)
  }
  
}
