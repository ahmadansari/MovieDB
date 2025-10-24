//
//  File.swift
//  MovieDB
//
//  Created by Ahmad Hassan Ansari on 30.08.23.
//

import Foundation
import SwiftUI

protocol DetailsBuilding {
    func detailsView(forMovie movie: MovieData, genreList: [GenreData]) -> DetailsView
}

class DetailsBuilder: DetailsBuilding {
    func detailsView(forMovie movie: MovieData, genreList: [GenreData]) -> DetailsView {
        let presenter = DetailsPresenter(movie: movie, genreList: genreList)
        return DetailsView(presenter: presenter)
    }
}
