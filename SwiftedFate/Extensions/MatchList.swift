//
//  MatchList.swift
//  SwiftedFate
//
//  Created by Alejandro Alonso on 7/18/16.
//  Copyright © 2016 Alejandro Alonso. All rights reserved.
//

import Foundation

//MatchList
public extension SwiftedFate {
  
  public final class matchList {
    
    internal var parent: SwiftedFate!
    
    private let matchListBase = "https://region.api.pvp.net/api/lol/region/v2.2/matchlist/by-summoner/"
    
    /*
     @param region: Region (Optional) - Specify region to execute against, or go to default
     summonerId: String - Summoner to get match list data from
     */
    public func getMatchList(region: Region? = nil, bySummonerId summonerId: String, completion: (NSDictionary?, Error?) -> Void) {
      let region = (region ?? parent.region)!
      let url = parent.createUrl(base: matchListBase, region: region, endpoint: summonerId)
      
      parent.request(url: url, completion: completion)
    }
    
  }
  
}
