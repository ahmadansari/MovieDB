//
//  MovieService.swift
//  MovieDB
//
//  Created by Ahmad Hassan Ansari on 22.08.23.
//

import Foundation

enum ServiceError: Error {
    case unknown
}

typealias ServiceResponseHandler<T> = (_ data: T?, _ error: Error?) -> Void

protocol MovieService {
    func genreList(completion: @escaping (Result<GenresServiceResponse, Error>) -> Void)
    func latestMovies(page: Int, completion: @escaping (Result<MovieServiceResponse, Error>) -> Void)
}

class MovieServiceImp: MovieService {
    private let apiConfig = APIConfig.load()

    func genreList(completion: @escaping (Result<GenresServiceResponse, Error>) -> Void) {
        guard var urlComponents = URLComponents(string: apiConfig.baseURL) else { return }
        urlComponents.path += ServicePath.genreList
        urlComponents.queryItems = [
            URLQueryItem(name: Keys.apiKey, value: apiConfig.apiKey),
        ]
        guard let url = urlComponents.url else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            if let data = data {
                do {
                    let result = try JSONDecoder().decode(GenresServiceResponse.self, from: data)
                    completion(.success(result))
                } catch {
                    print(error.localizedDescription)
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }

    func latestMovies(page: Int, completion: @escaping (Result<MovieServiceResponse, Error>) -> Void) {
        guard var urlComponents = URLComponents(string: apiConfig.baseURL) else { return }
        urlComponents.path += ServicePath.nowPlaying
        urlComponents.queryItems = [
            URLQueryItem(name: Keys.apiKey, value: apiConfig.apiKey),
            URLQueryItem(name: Keys.page, value: String(page)),
        ]
        guard let url = urlComponents.url else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            if let data = data {
                do {
                    let result = try JSONDecoder().decode(MovieServiceResponse.self, from: data)
                    completion(.success(result))
                } catch {
                    print(error.localizedDescription)
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }
}
