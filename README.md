# SwiftedFate
SwiftedFate is a very simple and lightweight swift framework for the League of Legends API.

## Basic Usage
```swift
import SwiftedFate

let sf = SwiftedFate(apiKey: "Key Here")

sf.Summoner.getSummoner(byName: "Azoy") { (data, error) in
  if error != nil {
    print(error!)
  }else {
    print(data!)
  }
}
```

## Documentation
Any and all documentation can be found here:
https://github.com/Azoy/SwiftedFate/wiki

### Disclaimer
**SwiftedFate isn't endorsed by Riot Games and doesn't reflect the views or opinions of Riot Games or anyone officially involved in producing or managing League of Legends. League of Legends and Riot Games are trademarks or registered trademarks of Riot Games, Inc. League of Legends © Riot Games, Inc.**
