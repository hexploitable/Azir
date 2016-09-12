//
//  Champion.swift
//  SwiftedFate
//
//  Created by Alejandro Alonso on 7/8/16.
//  Copyright © 2016 Alejandro Alonso. All rights reserved.
//

import Foundation

public extension SwiftedFate {
    
  public class _champion {
    
    internal var parent: SwiftedFate!
    
    private let championBase = "https://region.api.pvp.net/api/lol/region/v1.2/champion/"
    
    /*
     @param region: Region (Optional) - Specify region to request against, or go to default
     freeToPlay: Bool (Optional) - Specify whether you want to filter champions based off free to play
     */
    public func getChampions(region: Region? = nil, freeToPlay: Bool = false, completion: @escaping (NSDictionary?, Error?) -> Void) {
      let region = (region ?? parent.region)!
      let options = ["freeToPlay": freeToPlay.description]
      let url = parent.createUrl(base: championBase, region: region, endpoint: "", options: options)
      
      parent.request(url: url, completion: completion)
    }
    
    /*
     @param region: Region (Optional) - Specify region to request against, or go to default
     championId: String - Champion's ID to request champion for
     */
    public func getChampion(region: Region? = nil, byId championId: String, completion: @escaping (NSDictionary?, Error?) -> Void) {
      let region = (region ?? parent.region)!
      let url = parent.createUrl(base: championBase, region: region, endpoint: "\(championId)")
      
      parent.request(url: url, completion: completion)
    }
    
  }
  
}
