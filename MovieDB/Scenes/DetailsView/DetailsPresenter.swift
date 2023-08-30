//
//  DetailsPresenter.swift
//  MovieDB
//
//  Created by Ahmad Hassan Ansari on 30.08.23.
//

import Foundation

protocol DetailsPresenting {
  var title: String { get }
  var backdropURL: URL? { get }
  var posterURL: URL? { get }
  var movieRatings: String { get }
  var movieLanguage: String { get }
  var formattedReleaseDate: String { get }
  var overview: String { get }
  var genres: String { get }
}

class DetailsPresenter: DetailsPresenting {
  private let movie: MovieData
  private let genreList: [GenreData]

  init(movie: MovieData, genreList: [GenreData]) {
    self.movie = movie
    self.genreList = genreList
  }

  var title: String { movie.originalTitle ?? "" }
  var backdropURL: URL? { movie.backdropURL() }
  var posterURL: URL? { movie.posterURL() }
  var movieRatings: String { movie.movieRatings() ?? "" }
  var movieLanguage: String { movie.movieLanguage() ?? "" }
  var formattedReleaseDate: String { movie.formattedReleaseDate() }
  var overview: String { movie.overview ?? "" }
  var genres: String {
    guard let genreIds = movie.genreIds else { return "" }
    let list = genreList.filter { genreIds.contains($0.id) }
    let sorted = list.sorted { $0.name ?? "" < $1.name ?? "" }
    return sorted.compactMap({$0.name}).joined(separator: ", ")
  }
}
