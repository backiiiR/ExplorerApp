//
//  BreedListView.swift
//  Explorer
//
//  Created by student on 09.03.24.
//

import SwiftUI

struct BreedListView: View {
    
    @ObservedObject var viewModel: BreedViewModel
    
    let breedURL: URL
    
    var body: some View {
        List(viewModel.breeds) { breed in
            NavigationLink(destination: BreedDetailsView(viewModel: BreedDetailsViewModel(breed: breed))) {
                Text(breed.name)
                    .font(.headline)
                    .foregroundColor(.black)
                    .padding(10)
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 3)
            }
            .listRowBackground(Color.gray.opacity(0.1))
        } // MARK: List End
        .onAppear {
            viewModel.fetchBreeds(from: breedURL)
        }
        .navigationBarTitle("Breeds", displayMode: .inline)
    } // MARK: body End
}

#Preview {
    BreedListView(viewModel: BreedViewModel(), breedURL: URL(string: "https://api.thecatapi.com/v1/breeds")!)
}
