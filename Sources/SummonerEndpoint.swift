import Foundation

extension SwiftedFate {
  
  public struct _summoner {
    
    var parent: SwiftedFate!
    
    private let base = "https://region.api.pvp.net/api/lol/region/v1.4/summoner/"
    
    public func get(byName name: String, region: Region? = nil, _ completion: @escaping (Summoner?, Error?) -> Void) {
      let region = (region ?? parent.region)!
      let url = parent.createUrl(base: base, region: region, endpoint: "by-name/\(name)")
      
      let item = DispatchWorkItem {
        self.parent.request(url: url) {(data, error) in
          if error != nil {
            completion(nil, error)
            return
          }
          
          let data = data as! [String: [String: Any]]
          let summoner = Summoner(data: data[name]!)
          completion(summoner, nil)
        }
      }
      
      parent.rateLimiter.add(item: item, to: region)
    }
    
  }
  
}
