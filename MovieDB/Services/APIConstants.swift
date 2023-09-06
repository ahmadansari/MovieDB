//
//  APIConstants.swift
//  MovieDB
//
//  Created by Ahmad Hassan Ansari on 22.08.23.
//

import Foundation
import UIKit

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
