import XCTest
import SwiftedFate

class SwiftedFateTests: XCTestCase {
    func testExample() {
      let sf = SwiftedFate(apiKey: "hi")
      sf.summoner.getSummoner(byName: "Azoy") { summoner, error in
        
      }
    }


    static var allTests : [(String, (SwiftedFateTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}
