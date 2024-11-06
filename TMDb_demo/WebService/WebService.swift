//
//  WebService.swift
//  TMDb_demo
//
//  Created by Shivam Maheshwari on 06/11/24.
//

import Foundation

final class WebService {
    
    func fetchData<T: Decodable>(from url: String) async throws -> T {
        guard let url = URL(string: url) else {
            throw NetworkError.invalidURL
        }
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NetworkError.invalidResponse
        }
        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            throw NetworkError.invalidData
        }
    }
    
}

enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
}
