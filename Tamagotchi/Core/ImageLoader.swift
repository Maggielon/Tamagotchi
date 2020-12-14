//
//  ImageLoader.swift
//  Tamagotchi
//
//  Created by Анастасия on 14.12.2020.
//  Copyright © 2020 Анастасия. All rights reserved.
//

import Foundation
import UIKit
import Combine

class ImageLoader: ObservableObject {
    
    @Published var image: UIImage?
    
    private var cancellable: AnyCancellable?
    
    init(url: URL?, placeholderImage: UIImage? = UIImage()) {
        guard let url = url else { return }
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { UIImage(data: $0.data) }
            .replaceError(with: placeholderImage)
            .receive(on: DispatchQueue.main)
            .assign(to: \.image, on: self)
    }
}
