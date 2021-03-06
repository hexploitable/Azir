//
//  Summoner.swift
//  SwiftedFate
//
//  Created by Alejandro Alonso on 7/7/16.
//  Copyright © 2016 Alejandro Alonso. All rights reserved.
//

import Foundation

public extension SwiftedFate {
  
  public class _summoner {
    
    internal var parent: SwiftedFate!
    
    private let summonerBase = "https://region.api.pvp.net/api/lol/region/v1.4/summoner/"
    
    /*
     @param region: Region (Optional) - Specify region to request against, or go to default
     summonerName: String - Summoner's name to request summoner info for
     */
    public func getSummoner(region: Region? = nil, byName summonerName: String, completion: @escaping (Summoner?, Error?) -> Void) {
      let region = (region ?? parent.region)!
      let url = parent.createUrl(base: summonerBase, region: region, endpoint: "by-name/\(summonerName)")
      
      parent.request(url: url, completion: completion)
    }
    
    /*
     @param region: Region (Optional) - Specify region to request against, or go to default
     summonerNames: Array<String> - Summoner names to request summoner info for
     */
    public func getSummoner(region: Region? = nil, byNames summonerNames: [String], completion: @escaping (NSDictionary?, Error?) -> Void) {
      let region = (region ?? parent.region)!
      let summonerNames = summonerNames.joined(separator: ",")
      let url = parent.createUrl(base: summonerBase, region: region, endpoint: "by-name/\(summonerNames)")
      
      parent.request(url: url, completion: completion)
    }
    
    /*
     @param region: Region (Optional) - Specify region to request against, or go to default
     summonerId: String - Summoner's ID to request summoner info for
     */
    public func getSummoner(region: Region? = nil, byId summonerId: String, completion: @escaping (NSDictionary?, Error?) -> Void) {
      let region = (region ?? parent.region)!
      let url = parent.createUrl(base: summonerBase, region: region, endpoint: summonerId)
      
      parent.request(url: url, completion: completion)
    }
    
    /*
     @param region: Region (Optional) - Specify region to request against, or go to default
     summonerIds: Array<String> - Summoner IDS to request summoner info for
     */
    public func getSummoner(region: Region? = nil, byIds summonerIds: [String], completion: @escaping (NSDictionary?, Error?) -> Void) {
      let region = (region ?? parent.region)!
      let summonerIds = summonerIds.joined(separator: ",")
      let url = parent.createUrl(base: summonerBase, region: region, endpoint: summonerIds)
      
      parent.request(url: url, completion: completion)
    }
    
    /*
     @param region: Region (Optional) - Specify region to request against, or go to default
     summonerId: String - Summoner ID to request masteries from
     */
    public func getMasteries(region: Region? = nil, bySummonerId summonerId: String, completion: @escaping (NSDictionary?, Error?) -> Void) {
      let region = (region ?? parent.region)!
      let url = parent.createUrl(base: summonerBase, region: region, endpoint: summonerId + "/masteries")
      
      parent.request(url: url, completion: completion)
    }
    
    /*
     @param region: Region (Optional) - Specify region to request against, or go to default
     summonerIds: Array<String> - Summoner IDs to request masteries from
     */
    public func getMasteries(region: Region? = nil, bySummonerIds summonerIds: [String], completion: @escaping (NSDictionary?, Error?) -> Void) {
      let region = (region ?? parent.region)!
      let summonerIds = summonerIds.joined(separator: ",")
      let url = parent.createUrl(base: summonerBase, region: region, endpoint: summonerIds + "/masteries")
      
      parent.request(url: url, completion: completion)
    }
    
    /*
     @param region: Region (Optional) - Specify region to request against, or go to default
     summonerId: String - Summoner ID to request name from
     */
    public func getName(region: Region? = nil, bySummonerId summonerId: String, completion: @escaping (NSDictionary?, Error?) -> Void) {
      let region = (region ?? parent.region)!
      let url = parent.createUrl(base: summonerBase, region: region, endpoint: summonerId + "/name")
      
      parent.request(url: url, completion: completion)
    }
    
    /*
     @param region: Region (Optional) - Specify region to request against, or go to default
     summonerIds: Array<String> - Summoner IDs to request names from
     */
    public func getName(region: Region? = nil, bySummonerIds summonerIds: [String], completion: @escaping (NSDictionary?, Error?) -> Void) {
      let region = (region ?? parent.region)!
      let summonerIds = summonerIds.joined(separator: ",")
      let url = parent.createUrl(base: summonerBase, region: region, endpoint: summonerIds + "/name")
      
      parent.request(url: url, completion: completion)
    }
    
    /*
     @param region: Region (Optional) - Specify region to request against, or go to default
     summonerId: String - Summoner ID to request runes from
     */
    public func getRunes(region: Region? = nil, bySummonerId summonerId: String, completion: @escaping (NSDictionary?, Error?) -> Void) {
      let region = (region ?? parent.region)!
      let url = parent.createUrl(base: summonerBase, region: region, endpoint: summonerId + "/runes")
      
      parent.request(url: url, completion: completion)
    }
    
    /*
     @param region: Region (Optional) - Specify region to request against, or go to default
     summonerIds: Array<String> - Summoner IDs to request runes from
     */
    public func getRunes(region: Region? = nil, bySummonerIds summonerIds: [String], completion: @escaping (NSDictionary?, Error?) -> Void) {
      let region = (region ?? parent.region)!
      let summonerIds = summonerIds.joined(separator: ",")
      let url = parent.createUrl(base: summonerBase, region: region, endpoint: summonerIds + "/runes")
      
      parent.request(url: url, completion: completion)
    }
    
  }
  
}
