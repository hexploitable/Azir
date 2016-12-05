import Foundation

//Request
extension SwiftedFate {
  
  func createUrl(base: String, region: Region, endpoint: String, options: [String: String] = [:], platform: String = Region.na.platformId) -> String {
    
    var url = base.replacingOccurrences(of: "region", with: region.rawValue)
    
    url = url.replacingOccurrences(of: "platform", with: platform) + endpoint + "?"
    
    for (key, value) in options {
      url += key + "=" + value + "&"
    }
    
    url += "api_key=" + self.apiKey
    
    return url.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlFragmentAllowed)!
    
  }
  
  func request(url: String, _ completion: @escaping (Any?, Error?) -> Void) {
    
    let task = session.dataTask(with: URL(string: url)!) { (data, response, error) in
      let response = response as! HTTPURLResponse
      let statusCode = response.statusCode
      if error != nil {
        completion(nil, response.getAPIError())
      }else {
        if (statusCode != 200) {
          completion(nil, response.getAPIError())
        }else {
          do {
            let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments)
            completion(json, nil)
          }catch {
            completion(nil, response.getAPIError())
          }
        }
      }
    }
    
    task.resume()
    
  }
  
}
