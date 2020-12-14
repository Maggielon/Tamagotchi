//
//  ShopViewModel.swift
//  Tamagotchi
//
//  Created by Анастасия on 14.12.2020.
//  Copyright © 2020 Анастасия. All rights reserved.
//

import Foundation
import Combine

class ShopViewModel: ObservableObject {
    
    @Published var foods: [Food] = []
    
    init() {
        let foods = (UserDefaultsManager.shared[.foods] as? [String]) ?? []
        self.foods = foods.compactMap { Food(title: $0) }
    }
    
    func getCount(for food: Food) -> Int {
        self.foods.filter { $0 == food }.count
    }
    
    func add(food: Food) {
        var foods = self.foods
        foods.append(food)
        self.foods = foods
        UserDefaultsManager.shared[.foods] = foods.compactMap { $0.title }
    }
}
