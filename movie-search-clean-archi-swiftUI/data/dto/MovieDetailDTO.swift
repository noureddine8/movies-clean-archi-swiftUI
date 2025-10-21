//
//  MovieDetailDTO.swift
//  movie-search-clean-archi-swiftUI
//
//  Created by Noureddine Louafi on 21/10/2025.
//

struct MovieDetailDTO: Codable {
    let imdbID: String
    let title: String
    let year: String
    let plot: String
    let director: String
    let imdbRating: String
    let poster: String
    
    enum CodingKeys: String, CodingKey {
        case imdbID = "imdbID"
        case title = "Title"
        case year = "Year"
        case plot = "Plot"
        case director = "Director"
        case imdbRating = "imdbRating"
        case poster = "Poster"
    }
    
    func toMovieDetailDomain() -> MovieDetail {
        MovieDetail(
            id: imdbID,
            title: title,
            year: year,
            plot: plot,
            director: director,
            rating: imdbRating,
            posterURL: poster != "N/A" ? poster : nil
        )
    }
}
