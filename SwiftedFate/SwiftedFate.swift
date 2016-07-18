//
//  SwiftedFate.swift
//  SwiftedFate
//
//  Created by Alejandro Alonso on 7/7/16.
//  Copyright © 2016 Alejandro Alonso. All rights reserved.
//

import Foundation

public class SwiftedFate {
    
  public var apiKey: String
  public var region: Region
  public var platform: Region.Platform
  public var locale: Options.Locale = .en_US
  
  public let Champion = champion()
  public let ChampionMastery = championMastery()
  public let CurrentGame = currentGame()
  public let FeaturedGames = featuredGames()
  public let League = league()
  public let Static = _static()
  public let Status = status()
  public let Match = match()
  public let MatchList = matchList()
  public let Stats = stats()
  public let Summoner = summoner()
  public let Team = team()
    
  //Create internal session for utility
  internal let session = NSURLSession.sharedSession()
    
  /*
   @param apiKey - Set's frameworks api key for request usage. Editable.
          region (Optional) - Set's frameworks default region to request against. Editable.
  */
  public init(apiKey: String, region: Region = .NA, platform: Region.Platform = .NA1) {
    self.apiKey = apiKey
    self.region = region
    self.platform = platform
    
    Champion.parent = self
    ChampionMastery.parent = self
    CurrentGame.parent = self
    FeaturedGames.parent = self
    League.parent = self
    Static.parent = self
    Status.parent = self
    Match.parent = self
    MatchList.parent = self
    Stats.parent = self
    Summoner.parent = self
    Team.parent = self
  }
    
}