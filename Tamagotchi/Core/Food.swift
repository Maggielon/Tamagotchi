//
//  Food.swift
//  Tamagotchi
//
//  Created by Анастасия on 14.12.2020.
//  Copyright © 2020 Анастасия. All rights reserved.
//

import Foundation

struct Food {
    var title: String
}

extension Food: Identifiable {
    var id: String {
        title
    }
}

extension Food: Equatable {
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.title == rhs.title
    }
}

extension Food {
    static var all: [Food] {
        [
            Food(title: "🍇 Grapes"),
            Food(title: "🍈 Melon"),
            Food(title: "🍉 Watermelon"),
            Food(title: "🍊 Tangerine"),
            Food(title: "🍋 Lemon"),
            Food(title: "🍌 Banana"),
            Food(title: "🍍 Pineapple"),
            Food(title: "🥭 Mango"),
            Food(title: "🍎 Red Apple"),
            Food(title: "🍏 Green Apple"),
            Food(title: "🍐 Pear"),
            Food(title: "🍑 Peach"),
            Food(title: "🍒 Cherries"),
            Food(title: "🍓 Strawberry"),
            Food(title: "🥝 Kiwi Fruit")
        ]
    }
}
