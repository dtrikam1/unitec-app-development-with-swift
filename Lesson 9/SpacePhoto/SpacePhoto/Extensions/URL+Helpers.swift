//
//  URL+Helpers.swift
//  SpacePhoto
//
//  Created by Dipesh Kumar Trikam on 8/09/19.
//  Copyright © 2019 Dipesh Kumar Trikam. All rights reserved.
//

import Foundation

extension URL {
    func withQueries(_ queries: [String: String]) -> URL? {
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
        components?.queryItems = queries.compactMap
            { URLQueryItem(name: $0.0, value: $0.1) }
        return components?.url
    }
    
    func withHTTPS() -> URL? {
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
        components?.scheme = "https"
        return components?.url
    }
}
