//
//  MoviesPresenter.swift
//  MovieDB
//
//  Created by Ahmad Hassan Ansari on 24.08.23.
//

import Combine
import Foundation
import SwiftUI

protocol MoviesPresenting: ObservableObject {
    var title: String { get }
    var genreList: [GenreData] { get }
    var movieList: [MovieData] { get }

    func fetchData()
    func fetchGenre(completion: @escaping (Bool) -> Void)
    func fetchMovies(completion: @escaping (Bool) -> Void)
}

class MoviesPresenter: MoviesPresenting {
    private var page: Int = PageInfo.defaultPage
    @Published var genreList = [GenreData]()
    @Published var movieList = [MovieData]()

    private let interactor = MoviesInteractor()

    var title: String { "Movies" }

    func fetchData() {
        fetchGenre { [weak self] _ in
            guard let self = self else { return }
            self.fetchMovies { _ in
                print("Genre: \(self.genreList)")
                print("Movies: \(self.movieList)")
            }
        }
    }

    func fetchGenre(completion: @escaping (Bool) -> Void) {
        interactor.fetchGenre { [weak self] result in
            guard let self = self else { return }
            switch result {
            case let .success(response):
                performBlock {
                    if let genere = response.genreList {
                        self.genreList.append(contentsOf: genere)
                    }
                    completion(true)
                }
            case let .failure(error):
                print(error)
                completion(false)
            }
        }
    }

    func fetchMovies(completion: @escaping (Bool) -> Void) {
        interactor.fetchMovies(page: page) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case let .success(response):
                performBlock {
                    self.page = response.page ?? PageInfo.defaultPage
                    if let movies = response.movies {
                        self.movieList.append(contentsOf: movies)
                    }
                    completion(true)
                }
            case let .failure(error):
                print(error)
                completion(false)
            }
        }
    }

    func loadNextPage() {
        page += 1
        fetchMovies { _ in }
    }
}
