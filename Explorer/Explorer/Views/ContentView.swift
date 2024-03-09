//
//  ContentView.swift
//  Explorer
//
//  Created by student on 09.03.24.
//

import SwiftUI

struct ContentView: View {
    let catURL = URL(string: "https://api.thecatapi.com/v1/breeds")!
    let dogURL = URL(string: "https://api.thedogapi.com/v1/breeds")!
        
    var body: some View {
        NavigationView {
            TabView {
                BreedListView(viewModel: BreedViewModel(), breedURL: catURL)
                    .tabItem {
                        Label("Cats", systemImage: "cat")
                    }
                BreedListView(viewModel: BreedViewModel(), breedURL: dogURL)
                    .tabItem {
                        Label("Dogs", systemImage: "dog")
                    }
            } // MARK: TabView End
            .accentColor(.blue)
        } // MARK: NavigationView End
        .navigationViewStyle(StackNavigationViewStyle())
        .edgesIgnoringSafeArea(.top)
    } // MARK: body End
}

#Preview {
    ContentView()
}
