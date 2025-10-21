//
//  dd.swift
//  movie-search-clean-archi-swiftUI
//
//  Created by Noureddine Louafi on 21/10/2025.
//

import SwiftUI

@Observable
class MovieSearchViewModel {
    var movies: [Movie] = []
    var isLoading = false
    var errorMessage: String?
    
    private let searchMovieUseCase: SearchMovieUseCase
    
    init(searchMovieUseCase: SearchMovieUseCase) {
        self.searchMovieUseCase = searchMovieUseCase
    }
    
    func searchMovies(name: String) async {
        isLoading = true
        errorMessage = nil
        do {
            movies = try await searchMovieUseCase.searchMovies(name: name)
        } catch {
            errorMessage = "Failed to search movies: \(error.localizedDescription)"
            movies = []
        }
        isLoading = false
    }
}
