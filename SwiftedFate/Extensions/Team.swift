//
//  Team.swift
//  SwiftedFate
//
//  Created by Alejandro Alonso on 7/18/16.
//  Copyright © 2016 Alejandro Alonso. All rights reserved.
//

import Foundation

//Team
public extension SwiftedFate {
  
  public class _team {
    
    internal var parent: SwiftedFate!
    
    private let teamBase = "https://region.api.pvp.net/api/lol/region/v2.4/team/"
    
    /*
     @param region: Region (Optional) - Specify region to execute against, or go to default
     summonerId: String - Summoner to get team data from
     */
    public func getTeams(region: Region? = nil, bySummonerId summonerId: String, completion: @escaping (NSDictionary?, Error?) -> Void) {
      let region = (region ?? parent.region)!
      let url = parent.createUrl(base: teamBase, region: region, endpoint: "by-summoner/\(summonerId)")
      
      parent.request(url: url, completion: completion)
    }
    
    /*
     @param region: Region (Optional) - Specify region to execute against, or go to default
     summonerIds: String - Summoners to get team data from
     */
    public func getTeams(region: Region? = nil, bySummonerIds summonerIds: [String], completion: @escaping (NSDictionary?, Error?) -> Void) {
      let region = (region ?? parent.region)!
      let summonerIds = summonerIds.joined(separator: ",")
      let url = parent.createUrl(base: teamBase, region: region, endpoint: "by-summoner/\(summonerIds)")
      
      parent.request(url: url, completion: completion)
    }
    
    /*
     @param region: Region (Optional) - Specify region to execute against, or go to default
     teamId: String - Team to get team data from
     */
    public func getTeam(region: Region? = nil, byTeamId teamId: String, completion: @escaping (NSDictionary?, Error?) -> Void) {
      let region = (region ?? parent.region)!
      let url = parent.createUrl(base: teamBase, region: region, endpoint: teamId)
      
      parent.request(url: url, completion: completion)
    }
    
    /*
     @param region: Region (Optional) - Specify region to execute against, or go to default
     teamIds: String - Teams to get team data from
     */
    public func getTeam(region: Region? = nil, byTeamIds teamIds: [String], completion: @escaping (NSDictionary?, Error?) -> Void) {
      let region = (region ?? parent.region)!
      let teamIds = teamIds.joined(separator: ",")
      let url = parent.createUrl(base: teamBase, region: region, endpoint: teamIds)
      
      parent.request(url: url, completion: completion)
    }
    
  }
  
}
