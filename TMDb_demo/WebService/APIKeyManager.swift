//
//  APIKeyManager.swift
//  TMDb_demo
//
//  Created by Shivam Maheshwari on 06/11/24.
//

import Foundation

final class APIKeyManager {
    static let shared = APIKeyManager()
    
    private init() {}
    
    func getAPIKey() -> String? {
        if let path = Bundle.main.path(forResource: Constant.SECRET_TEXT, ofType: Constant.PLIST_TEXT),
           let dictionary = NSDictionary(contentsOfFile: path),
           let apiKey = dictionary[Constant.API_KEY_TEXT.uppercased()] as? String {
            return apiKey
        }
        return nil
    }
}
