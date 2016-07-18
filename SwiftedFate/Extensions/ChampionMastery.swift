//
//  ChampionMastery.swift
//  SwiftedFate
//
//  Created by Alejandro Alonso on 7/8/16.
//  Copyright © 2016 Alejandro Alonso. All rights reserved.
//

import Foundation

//Champion Mastery
public extension SwiftedFate {
  
  public final class championMastery {
    
    internal var parent: SwiftedFate!
    
    private let championMasteryBase = "https://region.api.pvp.net/championmastery/location/platform/player/"
    
    /*
     @param region: Region (Optional) - The region to execute against
     platform: Region.Platform (Optional) - The platform to execure against
     summonerId: String - The Summoner ID to get specific champion mastery from
     championId: String - The Champion ID to get from summoner
     */
    public func getChampion(region region: Region? = nil, platform: Region.Platform? = nil, bySummonerId summonerId: String, byChampionId championId: String, completion: (NSDictionary?, Error?) -> Void) {
      let regionData = (region: (region ?? parent.region)!, platform: (platform ?? parent.platform)!)
      let url = parent.createUrl(base: championMasteryBase, region: regionData.region, endpoint: summonerId + "/champion/" + championId, platform: regionData.platform)
      
      parent.request(url: url, completion: completion)
    }
    
    /*
     @param region: Region (Optional) - The region to execute against
     platform: Region.Platform (Optional) - The platform to execure against
     summonerId: String - The Summoner ID to get champion masteries from
     */
    public func getChampions(region region: Region? = nil, platform: Region.Platform? = nil, bySummonerId summonerId: String, completion: (NSDictionary?, Error?) -> Void) {
      let regionData = (region: (region ?? parent.region)!, platform: (platform ?? parent.platform)!)
      let url = parent.createUrl(base: championMasteryBase, region: regionData.region, endpoint: summonerId + "/champions", platform: regionData.platform)
      
      parent.request(url: url, completion: completion)
    }
    
    /*
     @param region: Region (Optional) - The region to execute against
     platform: Region.Platform (Optional) - The platform to execure against
     summonerId: String - The Summoner ID to get champion mastery score from
     */
    public func getScore(region region: Region? = nil, platform: Region.Platform? = nil, bySummonerId summonerId: String, completion: (NSDictionary?, Error?) -> Void) {
      let regionData = (region: (region ?? parent.region)!, platform: (platform ?? parent.platform)!)
      let url = parent.createUrl(base: championMasteryBase, region: regionData.region, endpoint: summonerId + "/score", platform: regionData.platform)
      
      parent.request(url: url, completion: completion)
    }
    
    /*
     @param region: Region (Optional) - The region to execute against
     platform: Region.Platform (Optional) - The platform to execure against
     summonerId: String - The Summoner ID to get top champions from
     count: Int (Optional) - The amount of top champions to get
     */
    public func getTopChampions(region region: Region? = nil, platform: Region.Platform? = nil, bySummonerId summonerId: String, count: Int = 3, completion: (NSDictionary?, Error?) -> Void) {
      let regionData = (region: (region ?? parent.region)!, platform: (platform ?? parent.platform)!)
      let options = ["count": count.description]
      let url = parent.createUrl(base: championMasteryBase, region: regionData.region, endpoint: summonerId + "/topChampions", options: options, platform: regionData.platform)
      
      parent.request(url: url, completion: completion)
    }
    
  }
  
}