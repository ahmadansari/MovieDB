//
//  MovieDBApp.swift
//  MovieDB
//
//  Created by Ahmad Hassan Ansari on 22.08.23.
//

import SwiftUI

@main
struct MovieDBApp: App {

  init() {
    setupNavigationBarAppearance()
  }

  var body: some Scene {
    WindowGroup {
      ContentView()
    }
  }
}

extension MovieDBApp {
  func setupNavigationBarAppearance() {
    let appearance = UINavigationBarAppearance()
    appearance.configureWithTransparentBackground()
    let navBarBG = UIImage.init(named: "navBar")?.withRenderingMode(.alwaysOriginal).resizableImage(withCapInsets: .zero, resizingMode: .stretch)
    appearance.backgroundImage = navBarBG

    let navTintColor = UIColor.white

    // For Big Titles
    appearance.largeTitleTextAttributes = [
      .foregroundColor: navTintColor,
      .font: UIFont(name: "Rockout", size: 32.0) ?? UIFont.boldSystemFont(ofSize: 17)
    ]

    // For Small Titles
    appearance.titleTextAttributes = [
      .foregroundColor: navTintColor,
      .font: UIFont(name: "Rockout", size: 32.0) ?? UIFont.boldSystemFont(ofSize: 17)
    ]

    UINavigationBar.appearance().scrollEdgeAppearance = appearance
    UINavigationBar.appearance().compactAppearance = appearance
    UINavigationBar.appearance().standardAppearance = appearance  
  }
}
