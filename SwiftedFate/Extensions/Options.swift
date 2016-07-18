//
//  Options.swift
//  SwiftedFate
//
//  Created by Alejandro Alonso on 7/8/16.
//  Copyright © 2016 Alejandro Alonso. All rights reserved.
//

import Foundation

//Options
public extension SwiftedFate {
    
  //Create overview of options
  public enum Options {
    
    public enum QueueType: String {
      case RANKED_SOLO_5x5, RANKED_TEAM_3x3, RANKED_TEAM_5x5
    }
    
    public enum Locale: String {
      case cs_CZ, de_DE, el_GR, en_AU, en_GB, en_PH, en_PL, en_SG, en_US, es_AR, es_ES, es_MX, fr_FR, hu_HU, id_ID, it_IT, ja_JP, ko_KR, ms_MY, pl_PL, pt_BR, ro_RO, ru_RU, th_TH, tr_TR, vn_VN, zh_CN, zh_MY, zh_TW
      static let values = [cs_CZ, de_DE, el_GR, en_AU, en_GB, en_PH, en_PL, en_SG, en_US, es_AR, es_ES, es_MX, fr_FR, hu_HU, id_ID, it_IT, ja_JP, ko_KR, ms_MY, pl_PL, pt_BR, ro_RO, ru_RU, th_TH, tr_TR, vn_VN, zh_CN, zh_MY, zh_TW]
    }
    
    public enum Champion: String {
      case all, allytips, altimages, blurb, enemytips, image, info, lore, partype, passive, recommended, skins, spells, stats, tags
    }
    
    public enum Item: String {
      case all, colloq, consumeOnFull, consumed, depth, effect, from, gold, groups, hideFromAll, image, inStore, into, maps, requiredChampion, sanitizedDescription, specialRecipe, stacks, stats, tags, tree
    }
    
    public enum Mastery: String {
      case all, image, masteryTree, prereq, ranks, sanitizedDescription, tree
    }
    
    public enum Rune: String {
      case all, basic, colloq, consumeOnFull, consumed, depth, from, gold, hideFromAll, image, inStore, into, maps, requiredChampion, sanitizedDescription, specialRecipe, stacks, stats, tags
    }
    
    public enum Spell: String {
      case all, cooldown, cooldownBurn, cost, costBurn, costType, effect, effectBurn, image, key, leveltip, maxrank, modes, range, rangeBurn, resource, sanitizedDescription, sanitizedTooltip, tooltip, vars
    }
    
  }
  
}
