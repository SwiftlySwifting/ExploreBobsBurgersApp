//
//  SeasonModel.swift
//  ExploreBobsBurgersApp
//
//  Created by Scriffles on 8/9/23.
//

import Foundation

struct SeasonModel: Identifiable, Codable {
    var id: UUID
    var number: Int
    var episodes: [EpisodeModel]
    
    var expandEpis: Bool
    
    var orderFilterEpis: [EpisodeModel] {
        return episodes.sorted { a, b in
            a.episode < b.episode
        }
    }
}
