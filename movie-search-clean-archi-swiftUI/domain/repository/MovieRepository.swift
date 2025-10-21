//
//  MovieRepository.swift
//  movie-search-clean-archi-swiftUI
//
//  Created by Noureddine Louafi on 21/10/2025.
//

protocol MovieRepository {
    func searchMovies(query: String) async throws -> [Movie]
    func getMovieDetail(id: String) async throws -> MovieDetail
}
