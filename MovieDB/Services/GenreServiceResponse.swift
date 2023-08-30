//
//  GenreServiceResponse.swift
//  MovieDB
//
//  Created by Ahmad Hassan Ansari on 22.08.23.
//

import Foundation

struct GenresServiceResponse: Codable {
  let genreList: [GenreData]?
  private enum CodingKeys: String, CodingKey {
    case genreList = "genres"
  }
}

struct GenreData: Codable {
  let id: Int
  let name: String?
}
