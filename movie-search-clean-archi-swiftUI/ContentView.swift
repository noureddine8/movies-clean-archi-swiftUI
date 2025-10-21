//
//  ContentView.swift
//  movie-search-clean-archi-swiftUI
//
//  Created by Noureddine Louafi on 21/10/2025.
//

import SwiftUI

struct ContentView: View {
    let diContainer = AppDIContainer()

    var body: some View {
        MovieSearchView(viewModel: diContainer.makeMovieSearchViewModel())
    }
}

#Preview {
    ContentView()
}
