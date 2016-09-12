//
//  CurrentGame.swift
//  SwiftedFate
//
//  Created by Alejandro Alonso on 7/8/16.
//  Copyright © 2016 Alejandro Alonso. All rights reserved.
//

import Foundation

//Current Game
public extension SwiftedFate {
  
  public class _currentGame {
    
    internal var parent: SwiftedFate!
    
    private let currentGameBase = "https://region.api.pvp.net/observer-mode/rest/consumer/getSpectatorGameInfo/platform/"
    
    /*
     @param region: Region (Optional) - Region to execute against
     platform: Region.Platform (Optional) - Platform to execute against
     summonerId: String - Summoner ID to get current game info from
     */
    public func getCurrentGame(region: Region? = nil, platform: Platform? = nil, bySummonerId summonerId: String, completion: @escaping (NSDictionary?, Error?) -> Void) {
      let regionData = (region: (region ?? parent.region)!, platform: (platform ?? parent.platform)!)
      let url = parent.createUrl(base: currentGameBase, region: regionData.region, endpoint: summonerId, platform: regionData.platform)
      
      parent.request(url: url, completion: completion)
    }
    
  }
  
}
