//
//  MenuItemView.swift
//  Tamagotchi
//
//  Created by Анастасия on 14.12.2020.
//  Copyright © 2020 Анастасия. All rights reserved.
//

import SwiftUI

struct MenuItemView<Destination>: View where Destination: View {
    
    let menuType: MenuType
    let destination: Destination
    
    var body: some View {
        NavigationLink(destination: destination) {
            Text(self.menuType.title)
            .font(.largeTitle)
                .foregroundColor(.blue)
        }
    }
}

struct MenuItemView_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemView(menuType: .start, destination: GameView(character: Character.selectedCharacter))
    }
}
