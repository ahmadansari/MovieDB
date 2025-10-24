//
//  MoviesView.swift
//  MovieDB
//
//  Created by Ahmad Hassan Ansari on 24.08.23.
//

import Combine
import SwiftUI

struct MoviesView: View {
    @ObservedObject var presenter = MoviesPresenter()
    @State var selectedItem: MovieData?

    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            listView
        }
        .navigationBarTitle(presenter.title, displayMode: .inline)
    }

    var listView: some View {
        List(presenter.movieList, id: \.id) { movie in
            NavigationLink {
                DetailsBuilder().detailsView(forMovie: movie, genreList: presenter.genreList)
            } label: {
                MovieRow(movie: movie)
            }
            .listRowBackground(Color.clear)
            .listRowSeparator(.automatic)
            .listRowSeparatorTint(.white)
            .onAppear {
                if movie == presenter.movieList.last {
                    presenter.loadNextPage()
                }
            }
            .foregroundColor(.white)
        }
        .listStyle(.plain)
        .background(Color.clear)
        .onAppear(perform: presenter.fetchData)
    }
}

struct MoviesView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesView()
    }
}
