//
//  AppDIContainer.swift
//  movie-search-clean-archi-swiftUI
//
//  Created by Noureddine Louafi on 21/10/2025.
//

final class AppDIContainer {
    // Repositories
    lazy var movieRepository: MovieRepository = {
        OmdbRepository()
    }()
    
    // Use Cases
    lazy var searchMoviesUseCase: SearchMovieUseCase = {
        SearchMovieUseCase(movieRepository: movieRepository)
    }()
    
    // ViewModels
    func makeMovieSearchViewModel() -> MovieSearchViewModel {
        MovieSearchViewModel(searchMovieUseCase: searchMoviesUseCase)
    }
}
