//
//  MovieTrailerPlayerView.swift
//  TMDb_demo
//
//  Created by Shivam Maheshwari on 06/11/24.
//

import SwiftUI
import WebKit

struct MovieTrailerPlayerView: UIViewRepresentable {
    let trailerKey: String
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.scrollView.isScrollEnabled = false
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let urlString = getURLfor(scheme: Constant.URL_SCHEME,
                                        host: Constant.YOUTUBE_HOST,
                                        path: "\(Constant.EMBED_PATH)\(trailerKey)",
                                        queryParams: nil) else { return }
        guard let trailerUrl = URL(string: urlString) else { return }
        let request = URLRequest(url: trailerUrl)
        uiView.load(request)
    }
}
