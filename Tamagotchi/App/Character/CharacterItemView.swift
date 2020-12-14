//
//  CharacterItemView.swift
//  Tamagotchi
//
//  Created by Анастасия on 14.12.2020.
//  Copyright © 2020 Анастасия. All rights reserved.
//

import SwiftUI

struct CharacterItemView<Destination>: View where Destination: View {
    
    let character: Character
    let destination: Destination
    
    var body: some View {
        NavigationLink(destination: destination) {
            VStack {
                HStack {
                    RemoteImage(imageLoader: ImageLoader(url: self.character.url))
                    Text(self.character.name)
                }.padding(.horizontal, 20)
            }
        }
    }
}

struct CharacterItemView_Previews: PreviewProvider {
    static var previews: some View {
        let pikachu = Character(name: "pikachu", image: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/25.png")
        return CharacterItemView(character: pikachu, destination: GameView(character: pikachu))
    }
}
