//
//  Summoner.swift
//  Azir
//
//  Created by Alejandro Alonso
//  Copyright © 2017 Alejandro Alonso. All rights reserved.
//

public class SummonerEndpoint: Endpoint {

  let endpoint = "/api/lol/region/v1.4/summoner"

  public func get(_ name: String, from region: Region? = nil, then completion: @escaping ([String: Any]?, RequestError?) -> ()) {
    let region = (region ?? azir.region)!
    let url = self.createUrl(endpoint: self.endpoint + "/by-name/\(name)", region: region)
    azir.request(url, region: region, then: completion)
  }

}
