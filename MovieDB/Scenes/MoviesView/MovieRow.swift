//
//  MovieRow.swift
//  MovieDB
//
//  Created by Ahmad Hassan Ansari on 24.08.23.
//

import SwiftUI

struct MovieRow: View {
    var movie: MovieData

    var body: some View {
        HStack(alignment: .top) {
            AsyncImage(url: movie.posterURL()) { image in
                image.resizable().scaledToFit()
            } placeholder: {
                Constants.placeholderImage
            }.frame(width: 100)
            VStack(alignment: .leading, spacing: 8) {
                Text(movie.originalTitle ?? "")
                    .font(.headline)
                    .foregroundColor(Color(0xFF7F00))
                Text(movie.releaseDate ?? "")
                    .font(.subheadline)
                    .foregroundColor(Color(0x1E72F4))
                Text(movie.overview ?? "")
                    .font(.footnote)
                    .foregroundColor(Color.white)
            }
        }
        .listRowBackground(Color.clear)
        .listRowSeparator(.automatic)
        .listRowSeparatorTint(.white)
        .listRowInsets(EdgeInsets())
    }
}
