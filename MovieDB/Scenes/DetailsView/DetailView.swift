//
//  DetailsView.swift
//  MovieDB
//
//  Created by Ahmad Hassan Ansari on 24.08.23.
//

import Foundation
import SwiftUI

struct DetailsView: View {

  let presenter: any DetailsPresenting

  //MARK: Device Orientation
  @Environment(\.verticalSizeClass) var verticalSizeClass: UserInterfaceSizeClass?
  @Environment(\.horizontalSizeClass) var horizontalSizeClass: UserInterfaceSizeClass?

  var isPortrait: Bool {
    return verticalSizeClass == .regular && horizontalSizeClass == .compact
  }

  var isLandscape: Bool {
    return horizontalSizeClass == .regular && verticalSizeClass == .compact
  }

  //MARK: Views
  var body: some View {
    ZStack {
      Color.black.edgesIgnoringSafeArea(.all)
      detailView
    }
  }

  var detailView: some View {
    VStack(alignment: .leading) {

      if isPortrait {
        HStack(alignment: .top) {
          AsyncImage(url: presenter.backdropURL) { image in
            image.resizable().scaledToFit()
          } placeholder: {
            Constants.placeholderImage
          }.frame(width: UIScreen.main.bounds.width)
        }
      }

      HStack(alignment: .top) {
        AsyncImage(url: presenter.posterURL) { image in
          image.resizable().scaledToFit()
        } placeholder: {
          Constants.placeholderImage
        }.frame(width: 100)
        VStack(alignment: .leading, spacing: 8) {
          Text(presenter.title)
            .font(.headline)
            .foregroundColor(Color(0xFF7F00))

          Text(presenter.genres)
            .font(.subheadline)
            .foregroundColor(.white)

          HStack {
            Image("rating-star")
              .resizable()
              .scaledToFit()
              .frame(width: 15, height: 15)

            Text(presenter.movieRatings)
              .font(.footnote)
              .foregroundColor(.white)
          }

          Text(presenter.movieLanguage)
            .font(.subheadline)
            .foregroundColor(.white)
          
          Text(presenter.formattedReleaseDate)
            .font(.subheadline)
            .foregroundColor(Color(0x1E72F4))

        }
      }
      Divider().background(Color.white).padding(.bottom, 8)
      Text(presenter.overview)
        .font(.footnote)
        .foregroundColor(Color.white)

      Spacer()
    }
  }
}
