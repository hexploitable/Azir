import Foundation

#if !os(iOS)
  public extension SwiftedFate {
    
    public class RateLimiter {
      
      private let tenSLimit: Int
      private let tenMLimit: Int
      
      private let worker = DispatchQueue(label: "gg.azoy.swiftedfate", qos: .userInitiated)
      private var queue: [Region: Queue] = [:]
      
      public init(tenSLimit: Int = 10, tenMLimit: Int = 500) {
        self.tenSLimit = tenSLimit
        self.tenMLimit = tenMLimit
      }
      
      func add(item: DispatchWorkItem, to region: Region) {
        if queue[region] == nil {
          queue[region] = Queue(region: region, tenSLimit: tenSLimit, tenMLimit: tenMLimit)
        }
        
        queue[region]?.queue.append(item)
        execute(region: region)
      }
      
      private func execute(region: Region) {
        let now = Date()
        
        if now.timeIntervalSince((queue[region]?.tenSReset)!) > 10 {
          queue[region]?.tenSTokens = tenSLimit
          queue[region]?.tenSReset = now
        }
        
        if now.timeIntervalSince((queue[region]?.tenMReset)!) > 600 {
          queue[region]?.tenMTokens = tenMLimit
          queue[region]?.tenMReset = now
        }
        
        if queue[region]?.tenSTokens == 0 {
          let waitTime = UInt32(11 - now.timeIntervalSince((queue[region]?.tenSReset)!))
          
          sleep(waitTime)
          
          queue[region]?.tenSTokens = tenSLimit
          queue[region]?.tenSReset = now
        }
        
        if queue[region]?.tenMTokens == 0 {
          let waitTime = UInt32(601 - now.timeIntervalSince((queue[region]?.tenMReset)!))
          
          sleep(waitTime)
          
          queue[region]?.tenMTokens = tenMLimit
          queue[region]?.tenMReset = now
        }
        
        let item = self.queue[region]?.queue.remove(at: 0)
        
        worker.async(execute: item!)
        queue[region]?.tenSTokens -= 1
        queue[region]?.tenMTokens -= 1
      }
      
    }
    
  }
#endif
