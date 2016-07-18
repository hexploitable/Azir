//
//  Static.swift
//  SwiftedFate
//
//  Created by Alejandro Alonso on 7/8/16.
//  Copyright © 2016 Alejandro Alonso. All rights reserved.
//

import Foundation

//Static
public extension SwiftedFate {
    
  public final class _static {
  
    internal var parent: SwiftedFate!
    
    private let staticBase = "https://global.api.pvp.net/api/lol/static-data/region/v1.2/"
    
    /*
     @param region: Region (Optional) - Specify region to request against, or go to default
     locale: Options.Locale (Optional) - Specify locale to get data in, or go to default
     version: String (Optional) - Specify to get dated data, or go to latest
     dataById: Bool (Optional) - Specify to get data by championId, or go to keys
     options: [Options.Champion] (Optional) - Specify to get more data back, or just get default
     */
    public func getChampions(region region: Region? = nil, locale: Options.Locale? = nil, version: String = "", dataById: Bool = false, options: [Options.Champion] = [], completion: (NSDictionary?, Error?) -> Void) {
      let regionalData = (region: (region ?? parent.region)!, locale: (locale ?? parent.locale)!.rawValue)
      let optionsMapped = options.map {$0.rawValue}
      let options = ["locale": regionalData.locale, "version": version, "dataById": dataById.description, "champData": optionsMapped.joinWithSeparator(",")]
      let url = parent.createUrl(base: staticBase, region: regionalData.region, endpoint: "champion", options: options)
      
      parent.request(url: url, completion: completion)
    }
    
    /*
     @param region: Region (Optional) - Specify region to request against, or go to default
     championId: String - Champion to get data from
     locale: Options.Locale (Optional) - Specify locale to get data in, or go to default
     version: String (Optional) - Specify to get dated data, or go to latest
     dataById: Bool (Optional) - Specify to get data by championId, or go to keys
     options: [Options.Champion] (Optional) - Specify to get more data back, or just get default
     */
    public func getChampion(region region: Region? = nil, byChampionId championId: String, locale: Options.Locale? = nil, version: String = "", dataById: Bool = false, options: [Options.Champion] = [], completion: (NSDictionary?, Error?) -> Void) {
      let regionalData = (region: (region ?? parent.region)!, locale: (locale ?? parent.locale)!.rawValue)
      let optionsMapped = options.map {$0.rawValue}
      let options = ["locale": regionalData.locale, "version": version, "dataById": dataById.description, "champData": optionsMapped.joinWithSeparator(",")]
      let url = parent.createUrl(base: staticBase, region: regionalData.region, endpoint: "champion/\(championId)", options: options)
      
      parent.request(url: url, completion: completion)
    }
    
    /*
     @param region: Region (Optional) - Specify region to request against, or go to default
     locale: Options.Locale (Optional) - Specify locale to get data in, or go to default
     version: String (Optional) - Specify to get dated data, or go to latest
     options: [Options.Item] (Optional) - Specify to get more data back, or just get default
     */
    public func getItems(region region: Region? = nil, locale: Options.Locale? = nil, version: String = "", options: [Options.Item] = [], completion: (NSDictionary?, Error?) -> Void) {
      let regionalData = (region: (region ?? parent.region)!, locale: (locale ?? parent.locale)!.rawValue)
      let optionsMapped = options.map {$0.rawValue}
      let options = ["locale": regionalData.locale, "version": version, "itemListData": optionsMapped.joinWithSeparator(",")]
      let url = parent.createUrl(base: staticBase, region: regionalData.region, endpoint: "item", options: options)
      
      parent.request(url: url, completion: completion)
    }
    
    /*
     @param region: Region (Optional) - Specify region to request against, or go to default
     itemId: String - Item to get data from
     locale: Options.Locale (Optional) - Specify locale to get data in, or go to default
     version: String (Optional) - Specify to get dated data, or go to latest
     options: [Options.Item] (Optional) - Specify to get more data back, or just get default
     */
    public func getItem(region region: Region? = nil, byItemId itemId: String, locale: Options.Locale? = nil, version: String = "", options: [Options.Item] = [], completion: (NSDictionary?, Error?) -> Void) {
      let regionalData = (region: (region ?? parent.region)!, locale: (locale ?? parent.locale)!.rawValue)
      let optionsMapped = options.map {$0.rawValue}
      let options = ["locale": regionalData.locale, "version": version, "itemListData": optionsMapped.joinWithSeparator(",")]
      let url = parent.createUrl(base: staticBase, region: regionalData.region, endpoint: "item/\(itemId)", options: options)
      
      parent.request(url: url, completion: completion)
    }
    
    /*
     @param region: Region (Optional) - Specify region to request against, or go to default
     locale: Options.Locale (Optional) - Specify locale to get data in, or go to default
     version: String (Optional) - Specify to get dated data, or go to latest
     */
    public func getLanguageStrings(region region: Region? = nil, locale: Options.Locale? = nil, version: String = "", completion: (NSDictionary?, Error?) -> Void) {
      let regionalData = (region: (region ?? parent.region)!, locale: (locale ?? parent.locale)!.rawValue)
      let options = ["locale": regionalData.locale, "version": version]
      let url = parent.createUrl(base: staticBase, region: regionalData.region, endpoint: "language-strings", options: options)
      
      parent.request(url: url, completion: completion)
    }
    
    //Get current langauges that league support
    public func getLanguages() -> [String] {
      return Options.Locale.values.map {$0.rawValue}
    }
    
    /*
     @param region: Region (Optional) - Specify region to request against, or go to default
     locale: Options.Locale (Optional) - Specify locale to get data in, or go to default
     version: String (Optional) - Specify to get dated data, or go to latest
     */
    public func getMaps(region region: Region? = nil, locale: Options.Locale? = nil, version: String = "", completion: (NSDictionary?, Error?) -> Void) {
      let regionalData = (region: (region ?? parent.region)!, locale: (locale ?? parent.locale)!.rawValue)
      let options = ["locale": regionalData.locale, "version": version]
      let url = parent.createUrl(base: staticBase, region: regionalData.region, endpoint: "map", options: options)
      
      parent.request(url: url, completion: completion)
    }
    
    /*
     @param region: Region (Optional) - Specify region to request against, or go to default
     locale: Options.Locale (Optional) - Specify locale to get data in, or go to default
     version: String (Optional) - Specify to get dated data, or go to latest
     options: [Options.Mastery] (Optional) - Specify to get more data back, or just get default
     */
    public func getMasteries(region region: Region? = nil, locale: Options.Locale? = nil, version: String = "", options: [Options.Mastery], completion: (NSDictionary?, Error?) -> Void) {
      let regionalData = (region: (region ?? parent.region)!, locale: (locale ?? parent.locale)!.rawValue)
      let optionsMapped = options.map {$0.rawValue}
      let options = ["locale": regionalData.locale, "version": version, "masteryListData": optionsMapped.joinWithSeparator(",")]
      let url = parent.createUrl(base: staticBase, region: regionalData.region, endpoint: "mastery", options: options)
      
      parent.request(url: url, completion: completion)
    }
    
    /*
     @param region: Region (Optional) - Specify region to request against, or go to default
     masteryId: String - Mastery to get data from
     locale: Options.Locale (Optional) - Specify locale to get data in, or go to default
     version: String (Optional) - Specify to get dated data, or go to latest
     options: [Options.Mastery] (Optional) - Specify to get more data back, or just get default
     */
    public func getMastery(region region: Region?, byMasteryId masteryId: String, locale: Options.Locale? = nil, version: String = "", options: [Options.Mastery] = [], completion: (NSDictionary?, Error?) -> Void) {
      let regionalData = (region: (region ?? parent.region)!, locale: (locale ?? parent.locale)!.rawValue)
      let optionsMapped = options.map {$0.rawValue}
      let options = ["locale": regionalData.locale, "version": version, "masteryListData": optionsMapped.joinWithSeparator(",")]
      let url = parent.createUrl(base: staticBase, region: regionalData.region, endpoint: "mastery/\(masteryId)", options: options)
      
      parent.request(url: url, completion: completion)
    }
    
    /*
     @param region: Region (Optional) - Specify region to request against, or go to default
     */
    public func getRealm(region region: Region? = nil, completion: (NSDictionary?, Error?) -> Void) {
      let region = (region ?? parent.region)!
      let url = parent.createUrl(base: staticBase, region: region, endpoint: "realm")
      
      parent.request(url: url, completion: completion)
    }
    
    /*
     @param region: Region (Optional) - Specify region to request against, or go to default
     locale: Options.Locale (Optional) - Specify locale to get data in, or go to default
     version: String (Optional) - Specify to get dated data, or go to latest
     options: [Options.Rune] (Optional) - Specify to get more data back, or just get default
     */
    public func getRunes(region region: Region? = nil, locale: Options.Locale? = nil, version: String = "", options: [Options.Rune], completion: (NSDictionary?, Error?) -> Void) {
      let regionalData = (region: (region ?? parent.region)!, locale: (locale ?? parent.locale)!.rawValue)
      let optionsMapped = options.map {$0.rawValue}
      let options = ["locale": regionalData.locale, "version": version, "masteryListData": optionsMapped.joinWithSeparator(",")]
      let url = parent.createUrl(base: staticBase, region: regionalData.region, endpoint: "rune", options: options)
      
      parent.request(url: url, completion: completion)
    }
    
    /*
     @param region: Region (Optional) - Specify region to request against, or go to default
     runeId: String - Rune to get data from
     locale: Options.Locale (Optional) - Specify locale to get data in, or go to default
     version: String (Optional) - Specify to get dated data, or go to latest
     options: [Options.Rune] (Optional) - Specify to get more data back, or just get default
     */
    public func getRune(region region: Region? = nil, byRuneId runeId: String, locale: Options.Locale? = nil, version: String = "", options: [Options.Rune], completion: (NSDictionary?, Error?) -> Void) {
      let regionalData = (region: (region ?? parent.region)!, locale: (locale ?? parent.locale)!.rawValue)
      let optionsMapped = options.map {$0.rawValue}
      let options = ["locale": regionalData.locale, "version": version, "masteryListData": optionsMapped.joinWithSeparator(",")]
      let url = parent.createUrl(base: staticBase, region: regionalData.region, endpoint: "rune/\(runeId)", options: options)
      
      parent.request(url: url, completion: completion)
    }
    
    /*
     @param region: Region (Optional) - Specify region to request against, or go to default
     locale: Options.Locale (Optional) - Specify locale to get data in, or go to default
     version: String (Optional) - Specify to get dated data, or go to latest
     options: [Options.Spell] (Optional) - Specify to get more data back, or just get default
     */
    public func getSummonerSpells(region region: Region? = nil, locale: Options.Locale? = nil, version: String = "", options: [Options.Spell], completion: (NSDictionary?, Error?) -> Void) {
      let regionalData = (region: (region ?? parent.region)!, locale: (locale ?? parent.locale)!.rawValue)
      let optionsMapped = options.map {$0.rawValue}
      let options = ["locale": regionalData.locale, "version": version, "masteryListData": optionsMapped.joinWithSeparator(",")]
      let url = parent.createUrl(base: staticBase, region: regionalData.region, endpoint: "summoner-spell", options: options)
      
      parent.request(url: url, completion: completion)
    }
    
    /*
     @param region: Region (Optional) - Specify region to request against, or go to default
     spellId: String - Spell to get data from
     locale: Options.Locale (Optional) - Specify locale to get data in, or go to default
     version: String (Optional) - Specify to get dated data, or go to latest
     options: [Options.Spell] (Optional) - Specify to get more data back, or just get default
     */
    public func getSummonerSpell(region region: Region? = nil, bySpellId spellId: String, locale: Options.Locale? = nil, version: String = "", options: [Options.Spell], completion: (NSDictionary?, Error?) -> Void) {
      let regionalData = (region: (region ?? parent.region)!, locale: (locale ?? parent.locale)!.rawValue)
      let optionsMapped = options.map {$0.rawValue}
      let options = ["locale": regionalData.locale, "version": version, "masteryListData": optionsMapped.joinWithSeparator(",")]
      let url = parent.createUrl(base: staticBase, region: regionalData.region, endpoint: "summoner-spell/\(spellId)", options: options)
      
      parent.request(url: url, completion: completion)
    }
    
    /*
     @param region: Region (Optional) - Specify region to request against, or go to default
     */
    public func getVersions(region region: Region? = nil, completion: (NSDictionary?, Error?) -> Void) {
      let region = (region ?? parent.region)!
      let url = parent.createUrl(base: staticBase, region: region, endpoint: "versions")
      
      parent.request(url: url, completion: completion)
    }
    
  }
  
}