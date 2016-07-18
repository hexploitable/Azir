//
//  League.swift
//  SwiftedFate
//
//  Created by Alejandro Alonso on 7/8/16.
//  Copyright © 2016 Alejandro Alonso. All rights reserved.
//

import Foundation

//League
public extension SwiftedFate {
    
  public final class league {
    
    internal var parent: SwiftedFate!
    
    private let leagueBase = "https://region.api.pvp.net/api/lol/region/v2.5/league/"
    
    /*
     @param region: Region (Optional) - Region to execute against
     summonerId: String - Summoner ID to get leagues from
     */
    public func getSummonerLeagues(region region: Region? = nil, byId summonerId: String, completion: (NSDictionary?, Error?) -> Void) {
      let region = (region ?? parent.region)!
      let url = parent.createUrl(base: leagueBase, region: region, endpoint: "by-summoner/\(summonerId)")
      
      parent.request(url: url, completion: completion)
    }
    
    /*
     @param region: Region (Optional) - Region to execute against
     summonerIds: Array<String> - Summoner IDs to get leagues from
     */
    public func getSummonerLeagues(region region: Region? = nil, byIds summonerIds: [String], completion: (NSDictionary?, Error?) -> Void) {
      let region = (region ?? parent.region)!
      let summonerIds = summonerIds.joinWithSeparator(",")
      let url = parent.createUrl(base: leagueBase, region: region, endpoint: "by-summoner/\(summonerIds)")
      
      parent.request(url: url, completion: completion)
    }
    
    /*
     @param region: Region (Optional) - Region to execute against
     summonerId: String - Summoner ID to get league entries from
     */
    public func getSummonerLeagueEntries(region region: Region? = nil, byId summonerId: String, completion: (NSDictionary?, Error?) -> Void) {
      let region = (region ?? parent.region)!
      let url = parent.createUrl(base: leagueBase, region: region, endpoint: "by-summoner/\(summonerId)/entry")
      
      parent.request(url: url, completion: completion)
    }
    
    /*
     @param region: Region (Optional) - Region to execute against
     summonerIds: Array<String> - Summoner IDs to get league entries from
     */
    public func getSummonerLeagueEntries(region region: Region? = nil, byIds summonerIds: [String], completion: (NSDictionary?,Error?) -> Void) {
      let region = (region ?? parent.region)!
      let summonerIds = summonerIds.joinWithSeparator(",")
      let url = parent.createUrl(base: leagueBase, region: region, endpoint: "by-summoner/\(summonerIds)/entry")
      
      parent.request(url: url, completion: completion)
    }
    
    /*
     @param region: Region (Optional) - Region to execute against
     teamId: String - Team ID to get leagues from
     */
    public func getTeamLeagues(region region: Region? = nil, byId teamId: String, completion: (NSDictionary?, Error?) -> Void) {
      let region = (region ?? parent.region)!
      let url = parent.createUrl(base: leagueBase, region: region, endpoint: "by-team/\(teamId)")
      
      parent.request(url: url, completion: completion)
    }
    
    /*
     @param region: Region (Optional) - Region to execute against
     teamIds: Array<String> - Team IDs to get leagues from
     */
    public func getTeamLeagues(region region: Region? = nil, byIds teamIds: [String], completion: (NSDictionary?, Error?) -> Void) {
      let region = (region ?? parent.region)!
      let teamIds = teamIds.joinWithSeparator(",")
      let url = parent.createUrl(base: leagueBase, region: region, endpoint: "by-team/\(teamIds)")
      
      parent.request(url: url, completion: completion)
    }
    
    /*
     @param region: Region (Optional) - Region to execute against
     teamId: String - Team ID to get league entries from
     */
    public func getTeamLeagueEntries(region region: Region? = nil, byId teamId: String, completion: (NSDictionary?, Error?) -> Void) {
      let region = (region ?? parent.region)!
      let url = parent.createUrl(base: leagueBase, region: region, endpoint: "by-team/\(teamId)/entry")
      
      parent.request(url: url, completion: completion)
    }
    
    /*
     @param region: Region (Optional) - Region to execute against
     teamIds: String - Team IDs to get league entries from
     */
    public func getTeamLeagueEntries(region region: Region? = nil, byIds teamIds: Array<String>, completion: (NSDictionary?, Error?) -> Void) {
      let region = (region ?? parent.region)!
      let teamIds = teamIds.joinWithSeparator(",")
      let url = parent.createUrl(base: leagueBase, region: region, endpoint: "by-team/\(teamIds)/entry")
      
      parent.request(url: url, completion: completion)
    }
    
    /*
     @param region: Region (Optional) - Region to execute against
     type: Options.QueueType - Queue to get challenger league from
     */
    public func getChallengerLeague(region region: Region? = nil, byQueue type: Options.QueueType, completion: (NSDictionary?, Error?) -> Void) {
      let region = (region ?? parent.region)!
      let options = ["type": type.rawValue]
      let url = parent.createUrl(base: leagueBase, region: region, endpoint: "challenger", options: options)
      
      parent.request(url: url, completion: completion)
    }
    
    /*
     @param region: Region (Optional) - Region to execute against
     type: Options.QueueType - Queue to get master league from
     */
    public func getMasterLeague(region region: Region? = nil, byQueue type: Options.QueueType, completion: (NSDictionary?, Error?) -> Void) {
      let region = (region ?? parent.region)!
      let options = ["type": type.rawValue]
      let url = parent.createUrl(base: leagueBase, region: region, endpoint: "master", options: options)
      
      parent.request(url: url, completion: completion)
    }
    
  }
  
}