//
//  MovieListView.swift
//  TMDb_demo
//
//  Created by Shivam Maheshwari on 06/11/24.
//

import SwiftUI

struct MovieListView: View {
    
    @StateObject var viewModel = MovieListViewModel(webService: WebService())
    
    var body: some View {
        NavigationStack{
            VStack{
                if viewModel.showLoader {
                    LoaderView()
                        .frame(width: 100)
                } else {
                    ZStack{
                        List(viewModel.movies, id: \.self) { movie in
                            ZStack {
                                MovieListCellView(movieList: movie)
                                
                                NavigationLink(destination: MovieDetailView(viewModel: .init(movieId: movie.id, webService: WebService()))) {
                                    EmptyView()
                                }
                                .opacity(0)
                            }
                            .listRowSeparator(.hidden)
                        }.listStyle(GroupedListStyle())
                        .refreshable {
                            await viewModel.getMovieList()
                        }
                        
                        if viewModel.showRefreshText {
                            Text(Constant.REFRESH_TEXT)
                        }
                    }
                }
            }.navigationTitle(Constant.MOVIE_LIST_HEADER)
        }.task {
            await viewModel.getMovieList()
        }.alert(isPresented: $viewModel.showAlert) {
            Alert(title: Text(viewModel.errorMessage), message: nil, dismissButton: .default(Text(Constant.OKAY_TEXT)))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
    }
}
