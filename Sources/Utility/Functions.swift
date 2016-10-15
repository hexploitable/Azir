//
//  Functions.swift
//  SwiftedFate
//
//  Created by Azoy on 10/14/16.
//
//

import Foundation

internal extension SwiftedFate.Request {
  
  func convert(region: SwiftedFate.Region) -> String {
    switch region {
      case .kr, .ru:
        return region.rawValue.uppercased()
      case .eune:
        return "EUN1"
      case .oce:
        return "OC1"
      default:
        return region.rawValue.uppercased() + "1"
    }
  }
  
}
