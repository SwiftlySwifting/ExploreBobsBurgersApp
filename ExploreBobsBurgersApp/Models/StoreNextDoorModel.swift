//
//  StoreNextDoorModel.swift
//  ExploreBobsBurgersApp
//
//  Created by Scriffles on 8/16/23.
//

import Foundation

struct StoreNextDoorModel: Identifiable, Codable {
    var id: Int
    var name: String?
    var image: String?
    var season: Int
    var episode: Int
    var episodeUrl: String?
    var url: String?
}
