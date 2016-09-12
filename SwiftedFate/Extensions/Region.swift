//
//  Region.swift
//  SwiftedFate
//
//  Created by Alejandro Alonso on 7/7/16.
//  Copyright © 2016 Alejandro Alonso. All rights reserved.
//

import Foundation

//Region
public extension SwiftedFate {
    
  //Prevents wrong regions
  public enum Region: String {
    case br, eune, euw, jp, kr, lan, las, na, oce, tr, ru
  }
  
  //Prevents wrong platforms
  public enum Platform: String {
    case BR1, EUN1, EUW1, JP1, KR, LA1, LA2, NA1, OC1, TR1, RU
  }
  
}
