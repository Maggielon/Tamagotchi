//
//  GameView.swift
//  Tamagotchi
//
//  Created by Анастасия on 14.12.2020.
//  Copyright © 2020 Анастасия. All rights reserved.
//

import SwiftUI

struct GameView: View {
    var character: Character
    
    @ObservedObject var viewModel = GameViewModel()
    
    var body: some View {
        List {
            Section(header: Text("Status")) {
                VStack {
                    Text("Sleep")
                    Text("\(Int(self.viewModel.sleepPercent))%")
                        .font(.headline)
                        .onReceive(self.viewModel.timer) { _ in
                            self.viewModel.getSleepPercent()
                            
                    }
                }
                VStack {
                    Text("Eat")
                    Text("\(Int(self.viewModel.eatPercent))%")
                        .font(.headline)
                        .onReceive(self.viewModel.timer) { _ in
                            self.viewModel.getEatPercent()
                            
                    }
                }
                VStack {
                    Text("Food")
                    Text("\(self.viewModel.foods.count)")
                }
            }
            Section {
                RemoteImage(imageLoader: ImageLoader(url: character.url))
            }
            Section(header: Text("Actions")) {
                Button(action: {
                    self.viewModel.eat()
                }) {
                    Text("Eat")
                        .foregroundColor(.blue)
                }
                Button(action: {
                    self.viewModel.sleep()
                }, label: {
                    Text("Sleep")
                        .foregroundColor(.blue)
                })
                NavigationLink(destination: ShopView()) {
                    Text("Go to shop")
                        .background(Color.blue)
                        .foregroundColor(.white)
                }
            }
        }.onAppear {
            Character.selectedCharacter = self.character
            self.viewModel.setup()
        }.navigationBarTitle(character.name)
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        let pikachu = Character(name: "pikachu", image: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/25.png")
        return GameView(character: pikachu)
    }
}
