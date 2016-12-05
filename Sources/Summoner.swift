import Foundation

public extension SwiftedFate {
  
  struct Summoner {
    
    public let id: Int
    public let name: String
    public let profileIconId: Int
    public let revisionDate: Int
    public let summonerLevel: Int
    
    init(data: [String: Any]) {
      
      self.id = data["id"] as! Int
      self.name = data["name"] as! String
      self.profileIconId = data["profileIconId"] as! Int
      self.revisionDate = data["revisionDate"] as! Int
      self.summonerLevel = data["summonerLevel"] as! Int
      
    }
    
  }
  
}
