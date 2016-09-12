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
  public var platform: Platform
  public var locale: Options.Locale = .en_US
  
  public let champion = _champion()
  public let championMastery = _championMastery()
  public let currentGame = _currentGame()
  public let featuredGames = _featuredGames()
  public let league = _league()
  public let Static = _static()
  public let status = _status()
  public let match = _match()
  public let matchList = _matchList()
  public let stats = _stats()
  public let summoner = _summoner()
  public let team = _team()
    
  //Create internal session for utility
  internal let session = URLSession.shared
    
  /*
   @param apiKey - Set's frameworks api key for request usage. Editable.
          region (Optional) - Set's frameworks default region to request against. Editable.
  */
  public init(apiKey: String, region: Region = .na, platform: Platform = .NA1) {
    self.apiKey = apiKey
    self.region = region
    self.platform = platform
    
    champion.parent = self
    championMastery.parent = self
    currentGame.parent = self
    featuredGames.parent = self
    league.parent = self
    Static.parent = self
    status.parent = self
    match.parent = self
    matchList.parent = self
    stats.parent = self
    summoner.parent = self
    team.parent = self
  }
    
}
