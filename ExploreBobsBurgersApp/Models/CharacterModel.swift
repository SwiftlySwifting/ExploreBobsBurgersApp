//
//  CharacterModel.swift
//  ExploreBobsBurgersApp
//
//  Created by Scriffles on 7/28/23.
//

import Foundation

struct CharacterModel: Identifiable, Codable {
    var id: Int
    var name: String
    var image: String?
    var gender: String?
    var hairColor: String?
    var occupation: String?
    var firstEpisode: String?
    var voicedBy: String?
    var url: String?
    var wikiUrl: String?
    var relatives: [RelativeModel]
}
