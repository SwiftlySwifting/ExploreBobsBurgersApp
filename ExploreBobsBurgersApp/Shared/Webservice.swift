//
//  Webservice.swift
//  ExploreBobsBurgersApp
//
//  Created by Scriffles on 7/28/23.
//

import Foundation

class Webservice {
    
    func getAllCharacters() async throws -> [CharacterModel] {
        guard let url = URL(string: Constants.CHAR_URL) else { return [] }
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode([CharacterModel].self, from: data)
    }
}

extension URL {
    //build quieries for to format for url
    func withQuery(_ query: [String: String]) -> URL? {
        var compontents = URLComponents(url: self, resolvingAgainstBaseURL: true)
        compontents?.queryItems = query.map { URLQueryItem(name: $0.0, value: $0.1) }
        return compontents?.url
        
    }
}
