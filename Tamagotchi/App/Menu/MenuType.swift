//
//  MenuType.swift
//  Tamagotchi
//
//  Created by Анастасия on 14.12.2020.
//  Copyright © 2020 Анастасия. All rights reserved.
//

import Foundation

enum MenuType {
    case start, character
    
    var title: String {
        switch self {
        case .start: return "Start game"
        case .character: return "Select character"
        }
    }
}
