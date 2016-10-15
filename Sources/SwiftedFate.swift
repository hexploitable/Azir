//
//  Region.swift
//  SwiftedFate
//
//  Created by Azoy on 10/10/16.
//
//

public struct SwiftedFate {
  
  public var region: Region
  
  public let summoner: SummonerEndpoint
  
  public init(apiKey: String, region: Region = .na) {
    self.region = region
    
    let request = Request(apiKey: apiKey)
    
    self.summoner = SummonerEndpoint(region: region, request)
  }
  
}
