//
//  APIConstants.swift
//  MovieDB
//
//  Created by Ahmad Hassan Ansari on 22.08.23.
//

import Foundation
import UIKit

enum API {
    static let baseURL  = "http://api.themoviedb.org/3"
    static let apiKey   = "2696829a81b1b5827d515ff121700838"
}

enum ServicePath {
    static let nowPlaying           = "/movie/now_playing"
    static let genreList            = "/genre/movie/list"
    static let movieThumbnailPath   = "http://image.tmdb.org/t/p/%@/"
}

enum Keys {
    // MARK: - Service Parameter Keys
    static let page                 = "page"
    static let apiKey              = "api_key"
}

enum PageInfo {
    static let defaultPage = 1
}
