//
//  MovieSearch.swift
//  movie-search-clean-archi-swiftUI
//
//  Created by Noureddine Louafi on 21/10/2025.
//

import SwiftUI

struct MovieSearchView: View {
    var viewModel: MovieSearchViewModel
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $searchText, onSearchButtonClicked: {
                    Task {
                        await viewModel.searchMovies(name: searchText)
                    }
                })
                
                if viewModel.isLoading {
                    ProgressView()
                        .padding()
                }
                
                if let error = viewModel.errorMessage {
                    Text(error)
                        .foregroundColor(.red)
                        .padding()
                }
                
                List(viewModel.movies, id: \.id) { movie in
                    NavigationLink(destination: Text("Detail for \(movie.title)")) {
                        MovieRow(movie: movie)
                    }
                }
            }
            .navigationTitle("Movie Search")
        }
    }
}

struct SearchBar: View {
    @Binding var text: String
    let onSearchButtonClicked: () -> Void
    
    var body: some View {
        HStack {
            TextField("Search movies...", text: $text, onCommit: onSearchButtonClicked)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            
            Button("Search", action: onSearchButtonClicked)
                .padding(.trailing)
        }
        .padding(.vertical, 8)
    }
}

struct MovieRow: View {
    let movie: Movie
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(movie.title)
                    .font(.headline)
                Text(movie.year)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
        .padding(.vertical, 4)
    }
}
