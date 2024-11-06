//
//  MovieDetailModel.swift
//  TMDb_demo
//
//  Created by Shivam Maheshwari on 06/11/24.
//

struct MovieDetailModel: Codable {

    let backdropPath: String?
    let genres: [Genre]
    let id: Int
    let overview: String
    let posterPath: String
    let runtime: Int
    let title: String
    let voteAverage: Double
    let voteCount: Int
    let credits: Credits
    
    enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case genres
        case id
        case overview
        case posterPath = "poster_path"
        case runtime
        case title
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case credits
    }
    
    struct Genre: Codable, Hashable {
        let name: String
        
        enum CodingKeys: String, CodingKey {
            case name
        }
    }
    
    struct Credits: Codable {
        let cast: [Cast]
    }
    
    
    struct Cast: Codable, Hashable {
        let name: String
        let profilePath: String?
        let character: String
        
        enum CodingKeys: String, CodingKey {
            case name
            case profilePath = "profile_path"
            case character
        }
        
        var getPosterUrl: String {
            if let profilePath = profilePath {
                return getURLfor(scheme: Constant.URL_SCHEME,
                                 host: Constant.IMAGE_HOST,
                                 path: "\(Constant.IMAGE_PATH)\(profilePath)",
                                 queryParams: nil) ?? Constant.EMPTY_TEXT
            } else {
                return Constant.EMPTY_TEXT
            }
        }
    }
    
}

struct MovieTrailerModel: Codable {
    let videos: Videos
    
    enum CodingKeys: String, CodingKey {
        case videos
    }
}

struct Videos: Codable {
    let results: [Results]
}

struct Results: Codable, Hashable {
    let key: String
    let type: String
    
    enum CodingKeys: String, CodingKey {
        case key, type
    }
}

extension MovieDetailModel {
    var duration: String {
        let convertedRuntime = runtime.convertMinutesIntoHoursAndMinutes()
        return "\(convertedRuntime.hour)h \(convertedRuntime.minute)m"
    }
    
}
