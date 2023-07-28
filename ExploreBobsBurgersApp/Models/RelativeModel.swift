//
//  RelativeModel.swift
//  ExploreBobsBurgersApp
//
//  Created by Scriffles on 7/28/23.
//

import Foundation

struct RelativeModel: Codable, Identifiable {
    var id: String
    var name: String
    var wikiUrl: String?
    var relationship: String?
    var url: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name
        case wikiUrl
        case relationship
        case url
    }
}
