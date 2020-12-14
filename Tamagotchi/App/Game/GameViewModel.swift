//
//  GameViewModel.swift
//  Tamagotchi
//
//  Created by Анастасия on 14.12.2020.
//  Copyright © 2020 Анастасия. All rights reserved.
//

import Foundation
import Combine

class GameViewModel: ObservableObject {
    
    @Published var foods: [Food] = []
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    private let maxTimeEat: Double = 3600
    private let maxTimeSleep: Double = 3600 * 7
    
    @Published var eatPercent: Double
    @Published var sleepPercent: Double
    
    init() {
        self.eatPercent = UserDefaultsManager.shared[.eatPercent] ?? 0
        self.sleepPercent = UserDefaultsManager.shared[.sleepPercent] ?? 0
        self.setup()
    }
    
    func setup() {
        self.initEatPercent()
        self.initSleepPercent()
        self.getEatPercent()
        self.getSleepPercent()
        let foods = (UserDefaultsManager.shared[.foods] as? [String]) ?? []
        self.foods = foods.compactMap { Food(title: $0) }
    }
    
    func initEatPercent() {
        let date = Date().timeIntervalSince1970
        let offset = date - (UserDefaultsManager.shared[.eatTime] ?? 0)
        if offset > self.maxTimeEat {
            self.eatPercent = 0
        } else {
            self.eatPercent -= (100.0 * offset / self.maxTimeEat)
        }
        UserDefaultsManager.shared[.eatPercent] = self.eatPercent
        UserDefaultsManager.shared[.eatTime] = Date().timeIntervalSince1970
    }
    
    func getEatPercent() {
        self.eatPercent -= 100.0 / self.maxTimeEat
        UserDefaultsManager.shared[.eatPercent] = self.eatPercent
        UserDefaultsManager.shared[.eatTime] = Date().timeIntervalSince1970
    }
    
    func initSleepPercent() {
        let date = Date().timeIntervalSince1970
        let offset = date - (UserDefaultsManager.shared[.sleepTime] ?? 0)
        if offset > self.maxTimeSleep {
            self.sleepPercent = 0
        } else {
            self.sleepPercent -= 100.0 / self.maxTimeSleep * offset
        }
        UserDefaultsManager.shared[.sleepPercent] = self.sleepPercent
        UserDefaultsManager.shared[.sleepTime] = Date().timeIntervalSince1970
    }
    
    func getSleepPercent() {
        self.sleepPercent -= 100.0 / self.maxTimeSleep
        UserDefaultsManager.shared[.sleepPercent] = self.sleepPercent
        UserDefaultsManager.shared[.sleepTime] = Date().timeIntervalSince1970
    }
    
    func eat() {
        guard self.eatPercent < 100, self.foods.count > 0 else { return }
        _ = self.foods.popLast()
        UserDefaultsManager.shared[.foods] = self.foods.compactMap { $0.title }
        let value = self.value(for: self.eatPercent)
        self.eatPercent += value
        UserDefaultsManager.shared[.eatPercent] = self.eatPercent
        UserDefaultsManager.shared[.eatTime] = Date().timeIntervalSince1970
    }
    
    func sleep() {
        guard self.sleepPercent < 100 else { return }
        let value = self.value(for: self.sleepPercent)
        self.sleepPercent += value
        UserDefaultsManager.shared[.sleepPercent] = self.eatPercent
        UserDefaultsManager.shared[.sleepTime] = Date().timeIntervalSince1970
    }
    
    private func value(for percent: Double, defaultValue: Double = 10) -> Double {
        return percent + defaultValue > 100 ? 100 - percent : defaultValue
    }
}
