//
//  FlagFactory.swift
//  MilestoneOne
//
//  Created by Zach Tumbleson on 9/19/24.
//

import UIKit

enum Country: String, CaseIterable {
    case estonia
    case france
    case germany
    case ireland
    case italy
    case monaco
    case nigeria
    case poland
    case russia
    case spain
    case uk
    case us
    
    var flag: UIImage? {
        UIImage(named: self.rawValue)
    }
    
    var displayName: String {
        switch self {
        case .estonia:
            return "Estonia"
        case .france:
            return "France"
        case .germany:
            return "Germany"
        case .ireland:
            return "Ireland"
        case .italy:
            return "Italy"
        case .monaco:
            return "Monaco"
        case .nigeria:
            return "Nigeria"
        case .poland:
            return "Poland"
        case .russia:
            return "Russia"
        case .spain:
            return "Spain"
        case .uk:
            return "United Kingdom"
        case .us:
            return "United States"
        }
    }
}
