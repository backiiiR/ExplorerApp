//
//  BreedDetailsViewModel.swift
//  Explorer
//
//  Created by student on 09.03.24.
//

import Foundation
import Combine
import UIKit

class BreedDetailsViewModel: ObservableObject {
    @Published var breed: Breed
    @Published var image: UIImage?
    @Published var isLoading: Bool = false
    
    private var cancellable: AnyCancellable?
    
    init(breed: Breed) {
        self.breed = breed
        loadImage()
    }
    
    private func loadImage() {
        guard let url = breed.imageURL else { return }
        
        isLoading = true
        
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { UIImage(data: $0.data) }
            .replaceError(with: nil)
            .receive(on: DispatchQueue.main)
            .sink {[weak self] loadedImage in
                self?.isLoading = false
                self?.image = loadedImage
            }
    }
}
