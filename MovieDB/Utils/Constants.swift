//
//  Constants.swift
//  MovieDB
//
//  Created by Ahmad Hassan Ansari on 22.08.23.
//

import Foundation
import SwiftUI

enum Constants {
  // MARK: - Service Constants
  static let defaultPageSize      = 20
  static let releaseDateFormat    = "yyyy-MM-dd"

  // MARK: - UI Constants
  static let dateDisplayFormat    = "dd MMMM yyyy"
  static let placeholderImage     = Image("movie-placeholder")
}


enum BackdropSize {
  case w300
  case w780
  case w1280
  case original

  var stringValue: String {
    switch self {
    case .w300: return "w300"
    case .w780: return "w780"
    case .w1280: return "w1280"
    case .original: return "original"
    }
  }
}

enum PosterSize {
  case w92
  case w154
  case w185
  case w342
  case w500
  case w780
  case original

  var stringValue: String {
    switch self {
    case .w92: return "w92"
    case .w154: return "w154"
    case .w185: return "w185"
    case .w342: return "w342"
    case .w500: return "w500"
    case .w780: return "w780"
    case .original: return "original"
    }
  }
}


