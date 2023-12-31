//
//  EpisodeModel.swift
//  ExploreBobsBurgersApp
//
//  Created by Scriffles on 8/9/23.
//

import Foundation

struct EpisodeModel: Identifiable, Codable {
    var id: Int
    var name: String
    var productionCode: String?
    var airDate: String?
    var season: Int
    var episode: Int
    var totalViewers: String
    var url: String
    var wikiUrl: String
    
    var wikiUnwrappedUrl: URL {
        if let unwrapped = URL(string: wikiUrl) {
            return unwrapped
        } else {
            return URL(string: "https://bobs-burgers.fandom.com/wiki/Bob%27s_Burgers_Wiki")!
        }
    }
}
