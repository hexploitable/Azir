//
//  SwiftedFateTests.swift
//  SwiftedFateTests
//
//  Created by Alejandro Alonso on 7/7/16.
//  Copyright © 2016 Alejandro Alonso. All rights reserved.
//

import XCTest
import SwiftedFate

class SwiftedFateTests: XCTestCase {
  
  func testSf() {
    let sf = SwiftedFate(apiKey: "")
    sf.Summoner.getSummoner(byName: "Azoy") { (data, error) in
      
    }
  }
    
}
