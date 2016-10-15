//
//  Summoner.swift
//  SwiftedFate
//
//  Created by Azoy on 10/11/16.
//
//

import Foundation

public extension SwiftedFate {

  public struct SummonerEndpoint {

    let base = "https://region.api.pvp.net/api/lol/region/v1.4/summoner/"
    let region: Region

    let request: Request

    init(region: Region, _ request: Request) {
      self.region = region
      self.request = request
    }

    public func getSummoner(region: Region? = nil, byName name: String, completionHandler: (Summoner, Error) -> Void) {
      let region = (region ?? self.region)!
      let url = self.request.createUrl(base: self.base, region: region, endpoint: "by-name/\(name)")
      self.request.get(url: url) { data, error in

      }
    }

  }

}
