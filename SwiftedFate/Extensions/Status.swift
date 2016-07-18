//
//  Status.swift
//  SwiftedFate
//
//  Created by Alejandro Alonso on 7/15/16.
//  Copyright © 2016 Alejandro Alonso. All rights reserved.
//

import Foundation

//Status
public extension SwiftedFate {
  
  public final class status {
    
    internal var parent: SwiftedFate!
    
    private let statusBase = "http://status.leagueoflegends.com/shards/"
    
    //Get all league server shards
    public func getShards(region region: Region? = nil, completion: (NSDictionary?, Error?) -> Void) {
      if region == nil {
        parent.request(url: statusBase, completion: completion)
      }else {
        parent.request(url: statusBase + "\(region?.rawValue)", completion: completion)
      }
    }
    
  }
  
}