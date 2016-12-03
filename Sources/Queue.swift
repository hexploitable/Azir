import Foundation

extension SwiftedFate {
  
  struct Queue {
    
    let region: Region
    
    var tenSTokens: Int
    var tenMTokens: Int
    
    var tenSReset = Date()
    var tenMReset = Date()
    
    var queue: [DispatchWorkItem] = []
    
    init(region: Region, tenSLimit: Int, tenMLimit: Int) {
      self.region = region
      self.tenSTokens = tenSLimit
      self.tenMTokens = tenMLimit
    }
    
  }
  
}
