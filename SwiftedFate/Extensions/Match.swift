//
//  Match.swift
//  SwiftedFate
//
//  Created by Alejandro Alonso on 7/17/16.
//  Copyright © 2016 Alejandro Alonso. All rights reserved.
//

import Foundation

//Match
public extension SwiftedFate {
  
  public class _match {
    
    internal var parent: SwiftedFate!
    
    private let matchBase = "https://region.api.pvp.net/api/lol/region/v2.2/match/"
    
    /*
     @param region: Region (Optional) - Specify region to request against, or go to default
     matchId: String - Match to get data from
     */
    public func getMatch(region: Region? = nil, byMatchId matchId: String, completion: @escaping (NSDictionary?, Error?) -> Void) {
      let region = (region ?? parent.region)!
      let url = parent.createUrl(base: matchBase, region: region, endpoint: "\(matchId)")
      
      parent.request(url: url, completion: completion)
    }
    
  }
  
}
