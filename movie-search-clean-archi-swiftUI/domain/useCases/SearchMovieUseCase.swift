//
//  SearchMovieUseCase.swift
//  movie-search-clean-archi-swiftUI
//
//  Created by Noureddine Louafi on 21/10/2025.
//

class SearchMovieUseCase {
    let movieRepository: MovieRepository
    
    init(movieRepository: MovieRepository) {
        self.movieRepository = movieRepository
    }
    
    func searchMovies(name: String) async throws -> [Movie] {
        // Example Business rule: don't search if query is too short
        guard name.count >= 2 else {
            return []
        }
        return try await movieRepository.searchMovies(query: name)
    }
}
