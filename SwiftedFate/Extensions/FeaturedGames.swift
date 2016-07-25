//
//  FeaturedGames.swift
//  SwiftedFate
//
//  Created by Alejandro Alonso on 7/8/16.
//  Copyright © 2016 Alejandro Alonso. All rights reserved.
//

import Foundation

//Featured Games
public extension SwiftedFate {
  
  public final class featuredGames {
    
    internal var parent: SwiftedFate!
    
    private let featuredGamesBase = "https://region.api.pvp.net/observer-mode/rest/featured/"
    
    /*
     @param region: Region (Optional) - Region to execute against
     */
    public func getFeaturedGames(_ region: Region? = nil, completion: (NSDictionary?, Error?) -> Void) {
      let region = (region ?? parent.region)!
      let url = parent.createUrl(base: featuredGamesBase, region: region, endpoint: "")
      
      parent.request(url: url, completion: completion)
    }
    
  }
  
}
