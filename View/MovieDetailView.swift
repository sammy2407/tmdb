//
//  MovieDetailView.swift
//  TMDb_demo
//
//  Created by Shivam Maheshwari on 06/11/24.
//

import SwiftUI
import WebKit
import SDWebImageSwiftUI

struct MovieDetailView: View {
    
    @StateObject var viewModel: MovieDetailViewModel
    
    var body: some View {
        ScrollView {
            if viewModel.showLoader {
                LoaderView()
                    .frame(width: 100)
            } else {
                VStack(spacing: 16) {
                    movieDetailView
                    if viewModel.movieTrailer.isEmpty {
                        LoaderView()
                            .frame(width: 200, height: 200, alignment: .center)
                    } else {
                        trailerView
                    }
                    plotView
                    genreView
                    castView
                    Spacer()
                }
            }
        }
        .task {
            await viewModel.getMovieDetail()
            await viewModel.getMovieTrailer()
        }.alert(isPresented: $viewModel.showAlert) {
            Alert(title: Text(viewModel.errorMessage), message: nil, dismissButton: .default(Text(Constant.OKAY_TEXT)))
        }
        
    }
    
    fileprivate var castView: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .top, spacing: 0) {
                ForEach(viewModel.movieDetail?.credits.cast ?? [.init(name: Constant.EMPTY_DATA, profilePath: Constant.EMPTY_DATA, character: Constant.EMPTY_DATA)], id: \.self) { cast in
                    MovieCastView(name: cast.name,
                                  characterName: cast.character,
                                  profilePath: cast.getPosterUrl)
                    
                }
            }.padding(.leading, 12)
        }
    }
    
    fileprivate var genreView: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .top, spacing: 10) {
                ForEach(viewModel.movieDetail?.genres ?? [.init(name: Constant.EMPTY_DATA)], id: \.self) { genre in
                    MovieGenreView(genre: genre.name)
                }
            }.padding(.leading, 12)
        }.padding(.top, 5)
    }
    
    fileprivate var trailerView: some View {
        TabView {
            ForEach(viewModel.movieTrailer, id: \.self) { type in
                if type.type == Constant.TRAILER_TEXT {
                    MovieTrailerPlayerView(trailerKey: type.key)
                        .frame(height: 200)
                        .cornerRadius(10)
                        .padding(.vertical)
                        .padding(.horizontal, 12)
                }
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .frame(height: 270)
        .background(Color(.systemGray6))
        .cornerRadius(10)
    }
    
    fileprivate var movieDetailView: some View {
        HStack{
            VStack(alignment: .leading){
                Text(viewModel.movieDetail?.title ?? Constant.EMPTY_DATA)
                    .font(.largeTitle)
                Text(viewModel.movieDetail?.duration ?? Constant.EMPTY_DATA)
                StarView(rating: viewModel.movieDetail?.voteAverage ?? 0)
            }.padding(.horizontal, 12)
            Spacer()
        }
    }
    
    fileprivate var plotView: some View {
        Text(viewModel.movieDetail?.overview ?? Constant.EMPTY_DATA)
            .font(.subheadline)
            .multilineTextAlignment(.leading)
            .lineLimit(nil)
            .padding(.horizontal, 12)
    }
    
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(viewModel: .init(movieId: 912649, webService: WebService()))
    }
}

