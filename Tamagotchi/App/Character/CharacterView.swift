//
//  CharacterView.swift
//  Tamagotchi
//
//  Created by Анастасия on 14.12.2020.
//  Copyright © 2020 Анастасия. All rights reserved.
//

import SwiftUI

struct CharacterView: View {
    
    var body: some View {
        VStack {
            List(Character.all) { character in
                CharacterItemView(character: character, destination: GameView(character: character))
            }
        }.navigationBarTitle("Characters")
    }
}

struct CharacterView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterView()
    }
}
