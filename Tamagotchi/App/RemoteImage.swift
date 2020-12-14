//
//  RemoteImage.swift
//  Tamagotchi
//
//  Created by Анастасия on 14.12.2020.
//  Copyright © 2020 Анастасия. All rights reserved.
//

import SwiftUI
import UIKit

struct RemoteImage: View {
    
    @ObservedObject var imageLoader: ImageLoader
    
    var body: some View {
        Image(uiImage: self.imageLoader.image ?? UIImage())
            .resizable()
            .scaledToFit()
            .aspectRatio(contentMode: .fit)
            .frame(width: 150, height: 200)
    }
}
