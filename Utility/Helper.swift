//
//  Untitled.swift
//  TMDb_demo
//
//  Created by Shivam Maheshwari on 06/11/24.
//

import Foundation

func getURLfor(scheme: String, host: String, path: String, queryParams: [String: String]?) -> String? {
    
    var components = URLComponents()
    components.scheme = scheme
    components.host = host
    components.path = path
    
        
    if let queryParams = queryParams {
        components.queryItems = queryParams.map { URLQueryItem(name: $0.key, value: $0.value) }
    }
    
    if let url = components.url {
        return url.absoluteString
    } else {
        return nil
    }
}

extension Double {
    func roundToTenths() -> String {
        let value = (self * 10).rounded()
        return String(format: Constant.STRING_FORMAT, value / 10)
    }
}

extension Int {
    func convertMinutesIntoHoursAndMinutes() -> (hour: Int, minute: Int) {
        let hours = self / 60
        let remainingMinutes = self % 60
        return (hour: hours, minute: remainingMinutes)
    }
}
