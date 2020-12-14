//
//  ShopView.swift
//  Tamagotchi
//
//  Created by Анастасия on 14.12.2020.
//  Copyright © 2020 Анастасия. All rights reserved.
//

import SwiftUI

struct ShopView: View {
    
    @ObservedObject var viewModel = ShopViewModel()
    
    var body: some View {
        VStack {
            List(Food.all) { food in
                Button(action: {
                    self.viewModel.add(food: food)
                }) {
                    HStack {
                        Text(food.title)
                        Spacer()
                        Text("\(self.viewModel.getCount(for: food))")
                        Image(systemName: "plus")
                        .foregroundColor(.blue)
                    }
                }
                .buttonStyle(PlainButtonStyle())
            }
        }.navigationBarTitle("Shop")
    }
}

struct ShopView_Previews: PreviewProvider {
    static var previews: some View {
        ShopView()
    }
}
