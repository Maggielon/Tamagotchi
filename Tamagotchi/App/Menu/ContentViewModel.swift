//
//  ContentViewModel.swift
//  Tamagotchi
//
//  Created by Анастасия on 14.12.2020.
//  Copyright © 2020 Анастасия. All rights reserved.
//

import Foundation
import Combine

class ContentViewModel: ObservableObject {
    
    @Published var character: Character = Character.selectedCharacter
}
