//
//  MovieListViewModel.swift
//  TMDb_demo
//
//  Created by Shivam Maheshwari on 06/11/24.
//
import Foundation

@MainActor
class MovieListViewModel: ObservableObject {
    
    @Published var movies = [Movie]()
    @Published var errorMessage = Constant.EMPTY_TEXT
    @Published var showAlert: Bool = false
    
    private let webService: WebService
    
    init(webService: WebService) {
        self.webService = webService
    }
    
    var showLoader: Bool {
        movies.isEmpty && errorMessage.isEmpty
    }
    
    var showRefreshText: Bool {
        !errorMessage.isEmpty
    }
    
    func getMovieList() async {
        if let apiKey = APIKeyManager.shared.getAPIKey() {
            guard let urlString = getURLfor(scheme: Constant.URL_SCHEME,
                                            host: Constant.TMDB_HOST,
                                            path: "\(Constant.MOVIE_DETAIL_PATH)\(Constant.POPULAR_PATH)",
                                            queryParams: [Constant.API_KEY_TEXT: apiKey]) else { return }
            do {
                let movieList: MovieListModel = try await webService.fetchData(from: urlString)
                movies = movieList.results
            } catch (let error) {
                errorMessage = "\(Constant.ERROR_TEXT) \(error.localizedDescription)"
                showAlert = true
            }
        } else {
            errorMessage = Constant.API_KEY_ERROR_TEXT
            showAlert = true
        }
    }
}
