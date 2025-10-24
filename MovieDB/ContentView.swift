//
//  ContentView.swift
//  MovieDB
//
//  Created by Ahmad Hassan Ansari on 22.08.23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            MoviesView()
        }
        .tint(Color.white)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
