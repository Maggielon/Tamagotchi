//
//  InfoView.swift
//  Tamagotchi
//
//  Created by Анастасия on 14.12.2020.
//  Copyright © 2020 Анастасия. All rights reserved.
//

import SwiftUI

struct InfoView: View {
    var body: some View {
        List {
            Text("Тамагочи - это электронная игрушка в виде яйца с жидкокристаллическим дисплеем и кнопками. Смысл игры состоит в том, чтобы оказывать виртуальную помощь животному, которое мы видим на экране. Его нужно кормить, поить, играть с ним и т.д., чтобы он мог виртуально жить и стать взрослым. Если малыш окружит животного надлежащим уходом, то он увидит, как его питомец растёт каждый день, становясь все больше и красивей.")
            Section(header: Text("Описание основных функций")) {
                Text("1. Кормление")
                Text("2. Сон")
            }
        }
        .navigationBarTitle("Info")
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
