//
//  MovieGenreView.swift
//  TMDb_demo
//
//  Created by Shivam Maheshwari on 06/11/24.
//

import SwiftUI

struct MovieGenreView: View {
    let genre: String
    var body: some View {
        VStack{
            Text(genre)
                .foregroundStyle(.white)
                .font(.subheadline)
                .padding(6)
                .background(Color.gray.opacity(0.7))
                .cornerRadius(4)
        }
    }
}

#Preview {
    MovieGenreView(genre: "Horror")
}
