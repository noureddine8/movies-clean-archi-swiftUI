//
//  GetMovieDetailUseCase.swift
//  movie-search-clean-archi-swiftUI
//
//  Created by Noureddine Louafi on 21/10/2025.
//

class GetMovieDetailUseCase {
    let movieRepository: MovieRepository
    
    init(movieRepository: MovieRepository) {
        self.movieRepository = movieRepository
    }
    
    func getMovieDetail(id: String) async throws -> MovieDetail {
        return try await movieRepository.getMovieDetail(id: id)
    }
}
