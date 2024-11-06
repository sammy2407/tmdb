//
//  MovieDetailViewModel.swift
//  TMDb_demo
//
//  Created by Shivam Maheshwari on 06/11/24.
//
import Foundation

@MainActor
class MovieDetailViewModel: ObservableObject {
    
    @Published var movieDetail: MovieDetailModel? = nil
    @Published var movieTrailer = [Results]()
    @Published var errorMessage = Constant.EMPTY_TEXT
    @Published var showAlert: Bool = false
    private let movieId: Int
    private let webService: WebService
    
    init(movieId: Int, webService: WebService) {
        self.movieId = movieId
        self.webService = webService
    }
    
    var showLoader: Bool {
        movieDetail == nil && errorMessage.isEmpty
    }
    
    fileprivate func fetchMovieData(with appendPath: String) async {
        if let apiKey = APIKeyManager.shared.getAPIKey() {
            guard let urlString = getURLfor(scheme: Constant.URL_SCHEME,
                                            host: Constant.TMDB_HOST,
                                            path: "\(Constant.MOVIE_DETAIL_PATH)\(movieId)",
                                            queryParams: [
                                                Constant.API_KEY_TEXT: apiKey,
                                                Constant.APPEND_TO_RESPONSE_TEXT: appendPath
                                            ]) else { return }
            do {
                if appendPath == Constant.VIDEOS_TEXT {
                    let movieList: MovieTrailerModel = try await webService.fetchData(from: urlString)
                    movieTrailer = movieList.videos.results
                } else {
                    movieDetail = try await webService.fetchData(from: urlString)
                }
            } catch (let error) {
                errorMessage = "\(Constant.ERROR_TEXT) \(error.localizedDescription)"
                showAlert = true
            }
        } else {
            errorMessage = Constant.API_KEY_ERROR_TEXT
            showAlert = true
        }
    }
    
    func getMovieDetail() async {
        await fetchMovieData(with: Constant.CREDITS_TEXT)
    }
    
    func getMovieTrailer() async {
        await fetchMovieData(with: Constant.VIDEOS_TEXT)
    }
    
}
