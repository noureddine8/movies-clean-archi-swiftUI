//
//  OmdbRepository.swift
//  movie-search-clean-archi-swiftUI
//
//  Created by Noureddine Louafi on 21/10/2025.
//

import Foundation

class OmdbRepository: MovieRepository {
    private let apiKey = Secrets.apiKey
    private let baseURL = "https://www.omdbapi.com/"
    
    func getMovieDetail(id: String) async throws -> MovieDetail {
        let urlString = "\(baseURL)?apikey=\(apiKey)&i=\(id)&plot=full"
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
                
        let (data, _) = try await URLSession.shared.data(from: url)
        let dto = try JSONDecoder().decode(MovieDetailDTO.self, from: data)
                
        return dto.toMovieDetailDomain()
    }
    
    func searchMovies(name: String) async throws -> [Movie] {
        let urlString = "\(baseURL)?apikey=\(apiKey)&s=\(name)"
        guard let url = URL(string: urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "") else {
            throw URLError(.badURL)
        }
                
        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode(
            MovieSearchResponseDTO.self,
            from: data
        )
                
        return response.search?.map { $0.toMovieDomain() } ?? []
    }
}
