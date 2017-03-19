//
//  Azir.swift
//  Azir
//
//  Created by Alejandro Alonso
//  Copyright © 2017 Alejandro Alonso. All rights reserved.
//

import Foundation
import Dispatch
import Redbird

open class Azir {

  var globalLockQueue: [() -> ()] = []

  var globallyLocked = false

  let globalQueue = DispatchQueue(label: "gg.azoy.azir.global")

  let key: String

  let limit: [Int]

  var rateLimits: [Region: DualBucket] = [:]

  let redis: Redbird?

  public var region: Region

  let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue())

  public let summoner = SummonerEndpoint()

  public init(key: String, limit: [Int] = [10, 500], region: Region = .na, cache: Redbird? = nil) {
    self.key = key
    self.limit = limit
    self.redis = cache
    self.region = region

    self.summoner.azir = self
  }

}
