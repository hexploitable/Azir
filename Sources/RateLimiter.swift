import Foundation

#if !os(iOS)
  public extension SwiftedFate {
    
    public class RateLimiter {
      
      private let tenSecondLimit: Int
      private var tenSecondTokens: Int
      private var tenSecondReset = Date()
      
      private let tenMinuteLimit: Int
      private var tenMinuteTokens: Int
      private var tenMinuteReset = Date()
      
      private let worker = DispatchQueue(label: "gg.azoy.swiftedfate", qos: .userInitiated)
      private var queue: [DispatchWorkItem] = []
      
      public init(tenSecond: Int = 10, tenMinute: Int = 500) {
        self.tenSecondLimit = tenSecond
        self.tenMinuteLimit = tenMinute
        
        self.tenSecondTokens = tenSecond
        self.tenMinuteTokens = tenMinute
      }
      
      func add(item: DispatchWorkItem) {
        queue.append(item)
        execute()
      }
      
      private func execute() {
        let now = Date()
        
        if now.timeIntervalSince(tenSecondReset) > 10 {
          tenSecondTokens = tenSecondLimit
          tenSecondReset = now
        }
        
        if now.timeIntervalSince(tenMinuteReset) > 600 {
          tenMinuteTokens = tenMinuteLimit
          tenMinuteReset = now
        }
        
        let item = queue.remove(at: 0)
        
        if tenSecondTokens != 0 && tenMinuteTokens != 0 {
          worker.async(execute: item)
          tenSecondTokens -= 1
          tenMinuteTokens -= 1
        }else {
          if tenSecondTokens == 0 {
            let waitTime = UInt32(11 - now.timeIntervalSince(tenSecondReset))
            
            sleep(waitTime)
            
            tenSecondTokens = tenSecondLimit - 1
            tenSecondReset = now
          }
          
          if tenMinuteTokens == 0 {
            let waitTime = UInt32(601 - now.timeIntervalSince(tenMinuteReset))
            
            sleep(waitTime)
            
            tenMinuteTokens = tenMinuteLimit - 1
            tenMinuteReset = now
          }
          
          worker.async(execute: item)
        }
      }
      
    }
    
  }
#endif
