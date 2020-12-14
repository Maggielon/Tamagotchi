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
        #if os(watchOS)
        return List {
            VStack {
                Text("Selected character: ")
                RemoteImage(imageLoader: ImageLoader(url: self.viewModel.character.url))
                Text(Character.selectedCharacter.name)
                
            }
            MenuItemView(menuType: .start, destination: GameView(character: Character.selectedCharacter))
            MenuItemView(menuType: .character, destination: CharacterView())
            MenuItemView(menuType: .info, destination: InfoView())
        }.onAppear {
            self.viewModel.character = Character.selectedCharacter
        }
        #else
        return NavigationView {
            VStack {
                Text("Selected character: ")
                HStack {
                    RemoteImage(imageLoader: ImageLoader(url: self.viewModel.character.url))
                    Text(Character.selectedCharacter.name)
                }
                VStack(spacing: 50) {
                    MenuItemView(menuType: .start, destination: GameView(character: Character.selectedCharacter))
                    MenuItemView(menuType: .character, destination: CharacterView())
                    MenuItemView(menuType: .info, destination: InfoView())
                }
                Spacer()
            }.onAppear {
                self.viewModel.character = Character.selectedCharacter
            }
        }.navigationViewStyle(StackNavigationViewStyle())
        #endif
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
