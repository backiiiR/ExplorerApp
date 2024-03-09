//
//  BreedViewModel.swift
//  Explorer
//
//  Created by student on 09.03.24.
//

import Foundation
import Combine

class BreedViewModel: ObservableObject {
    @Published var breeds: [Breed] = []
    
    private var cancellables = Set<AnyCancellable>()
    
    func fetchBreeds(from url: URL) {
         URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: [Breed].self, decoder: JSONDecoder())
            .replaceError(with: [])
            .receive(on: DispatchSerialQueue.main)
            .sink {[weak self] loadedBreeds in
                self?.breeds = loadedBreeds
            }
            .store(in: &cancellables)
    }
}
