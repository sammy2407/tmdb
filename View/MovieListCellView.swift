//
//  MovieListCellView.swift
//  TMDb_demo
//
//  Created by Shivam Maheshwari on 06/11/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct MovieListCellView: View {
    let movieList: Movie
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            
            WebImage(url: URL(string: movieList.getPosterUrl)) { image in
                image.resizable()
            } placeholder: {
                Rectangle()
                    .foregroundColor(.gray)
            }
            .transition(.fade(duration: 0.5))
            .scaledToFit()
            .frame(width: 80, height: 100)
            .cornerRadius(8)
            
            VStack(alignment: .leading, spacing: 5){
                Text(movieList.title)
                    .font(.headline)
                Text("\(movieList.ratings)\(Constant.RATING_SCALE)")
                    .font(.subheadline)
                Text(movieList.releaseDate)
                    .font(.subheadline)
                Spacer()
                Divider()
                    .frame(width: UIScreen.main.bounds.width - 120, height: 1)
                    .background(Color.gray)
                    .offset(x: -5)
            }.frame(height: 100)
            Spacer()
        }
    }
}


struct MovieListCellView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListCellView(movieList: .init(id: 12345, posterPath: "https://image.tmdb.org/t/p/w500/63xYQj1BwRFielxsBDXvHIJyXVm.jpg", releaseDate: "2024-10-09", title: "Terrifier 3", voteAverage: 5.688))
    }
}
