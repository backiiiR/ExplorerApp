//
//  BreedDetailsView.swift
//  Explorer
//
//  Created by student on 09.03.24.
//

import SwiftUI

struct BreedDetailsView: View {
    @ObservedObject var viewModel: BreedDetailsViewModel
        
    var body: some View {
        VStack(spacing: 20) {
            if viewModel.image != nil {
                ImageView(image: viewModel.image)
            } else {
                if viewModel.isLoading {
                    ProgressView()
                        .scaleEffect(2.0)
                } else {
                    Image(systemName: "photo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, height: 200)
                        .foregroundStyle(.gray)
                }
            }

            Text(viewModel.breed.name)
                .font(.title)
                .foregroundStyle(.primary)
            
            if let description = viewModel.breed.description {
                Text(description)
                    .font(.body)
                    .foregroundStyle(.black)
                    .multilineTextAlignment(.center)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                    .shadow(radius: 3)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .navigationBarTitle(viewModel.breed.name, displayMode: .inline)
    } // MARK: body End
}

#Preview {
    BreedDetailsView(viewModel: BreedDetailsViewModel(breed: Breed(name: "Abyssinian", description: "The Abyssinian is easy to care for, and a joy to have in your home. They’re affectionate cats and love both people and other animals.", referenceImageID: "0XYvRd7oD", dogFriendly: 4)))
}
