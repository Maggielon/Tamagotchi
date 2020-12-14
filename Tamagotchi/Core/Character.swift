//
//  Character.swift
//  Tamagotchi
//
//  Created by Анастасия on 14.12.2020.
//  Copyright © 2020 Анастасия. All rights reserved.
//

import Foundation

struct Character {
    
    var name: String
    
    var image: String
    
    var url: URL {
        URL(string: image)!
    }
}

extension Character: Identifiable {
    var id: String {
        name
    }
}

extension Character {
    
    static var all: [Character] {
        return [
            Character(name: "pikachu", image: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/25.png"),
            Character(name: "ditto", image: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/132.png"),
            Character(name: "charmander", image: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/4.png"),
            Character(name: "snorlax", image: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/143.png"),
            Character(name: "jigglypuff", image: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/39.png")
        ]
    }
    
    static var selectedCharacter: Character {
        set {
            UserDefaultsManager.shared[.character] = newValue.name
        }
        get {
            let name = UserDefaultsManager.shared[.character]
            let pikachu = Character(name: "pikachu", image: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/25.png")
            return Character.all.first { $0.name == name } ?? pikachu
        }
    }
}
