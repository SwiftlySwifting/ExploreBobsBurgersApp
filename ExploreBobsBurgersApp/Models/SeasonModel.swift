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
}
