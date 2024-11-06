//
//  MovieListModel.swift
//  TMDb_demo
//
//  Created by Shivam Maheshwari on 06/11/24.
//

import Foundation

struct MovieListModel: Codable {
    let results: [Movie]

    enum CodingKeys: String, CodingKey {
        case results
    }
}

struct Movie: Codable, Hashable {
    let id: Int
    let posterPath: String
    let releaseDate: String
    let title: String
    let voteAverage: Double

    enum CodingKeys: String, CodingKey {
        case id, title
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
    }
}

extension Movie {
    var ratings: String {
        voteAverage.roundToTenths()
    }
    
    var getPosterUrl: String {
        getURLfor(scheme: "https", host: "image.tmdb.org", path: "/t/p/w500\(posterPath)", queryParams: nil) ?? ""
    }
}
