//
//  ContentView.swift
//  Tamagotchi
//
//  Created by Анастасия on 11.12.2020.
//  Copyright © 2020 Анастасия. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel = ContentViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("Selected character: ")
                    RemoteImage(imageLoader: ImageLoader(url: self.viewModel.character.url))
                    Text(Character.selectedCharacter.name)
                }
                Spacer()
                VStack(spacing: 50) {
                    MenuItemView(menuType: .start, destination: GameView(character: Character.selectedCharacter))
                    MenuItemView(menuType: .character, destination: CharacterView())
                }
                Spacer()
            }.onAppear {
                self.viewModel.character = Character.selectedCharacter
            }
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
