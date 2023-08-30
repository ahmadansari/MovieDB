//
//  MoviesInteractor.swift
//  MovieDB
//
//  Created by Ahmad Hassan Ansari on 24.08.23.
//

import Foundation

protocol MoviesInteracting {
  func fetchGenre(completion: @escaping (Result<GenresServiceResponse, Error>) -> Void)
  func fetchMovies(page: Int, completion: @escaping (Result<MovieServiceResponse, Error>) -> Void)
}

class MoviesInteractor: MoviesInteracting {
  private let service = MovieServiceImp()

  func fetchGenre(completion: @escaping (Result<GenresServiceResponse, Error>) -> Void) {
    service.genreList(completion: completion)
  }

  func fetchMovies(page: Int, completion: @escaping (Result<MovieServiceResponse, Error>) -> Void) {
    service.latestMovies(page: page, completion: completion)
  }
}
