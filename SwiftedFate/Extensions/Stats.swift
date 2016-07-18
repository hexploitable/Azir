//
//  Stats.swift
//  SwiftedFate
//
//  Created by Alejandro Alonso on 7/18/16.
//  Copyright © 2016 Alejandro Alonso. All rights reserved.
//

import Foundation

//Stats
public extension SwiftedFate {
  
  public final class stats {
    
    internal var parent: SwiftedFate!
    
    private let statsBase = "https://region.api.pvp.net/api/lol/region/v1.3/stats/by-summoner/"
    
    /*
     @param region: Region (Optional) - Specify region to execute against, or go to default
     summonerId: String - Summoner to get ranked stat data from
     */
    public func getRankedStats(region region: Region? = nil, bySummonerId summonerId: String, completion: (NSDictionary?, Error?) -> Void) {
      let region = (region ?? parent.region)!
      let url = parent.createUrl(base: statsBase, region: region, endpoint: summonerId + "/ranked")
      
      parent.request(url: url, completion: completion)
    }
    
    /*
     @param region: Region (Optional) - Specify region to execute against, or go to default
     summonerId: String - Summoner to get stats summary data from
     */
    public func getStatsSummary(region region: Region? = nil, bySummonerId summonerId: String, completion: (NSDictionary?, Error?) -> Void) {
      let region = (region ?? parent.region)!
      let url = parent.createUrl(base: statsBase, region: region, endpoint: summonerId + "/summary")
      
      parent.request(url: url, completion: completion)
    }
    
  }
  
}