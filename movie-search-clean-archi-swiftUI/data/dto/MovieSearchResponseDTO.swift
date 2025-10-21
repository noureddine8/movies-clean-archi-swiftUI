//
//  MovieSearchResponseDTO.swift
//  movie-search-clean-archi-swiftUI
//
//  Created by Noureddine Louafi on 21/10/2025.
//

struct MovieSearchResponseDTO: Codable {
    let search: [MovieItemDTO]?
    let totalResults: String?
    let response: String
    
    enum CodingKeys: String, CodingKey {
        case search = "Search"
        case totalResults = "totalResults"
        case response = "Response"
    }
}

struct MovieItemDTO: Codable {
    let imdbID: String
    let title: String
    let year: String
    let poster: String
    
    enum CodingKeys: String, CodingKey {
        case imdbID = "imdbID"
        case title = "Title"
        case year = "Year"
        case poster = "Poster"
    }
    
    func toMovieDomain() -> Movie {
        Movie(
            id: imdbID,
            title: title,
            year: year,
            posterURL: poster != "N/A" ? poster : nil
        )
    }
}
