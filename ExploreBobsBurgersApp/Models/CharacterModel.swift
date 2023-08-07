//
//  CharacterModel.swift
//  ExploreBobsBurgersApp
//
//  Created by Scriffles on 7/28/23.
//

import Foundation

struct CharacterModel: Identifiable, Codable, Equatable {
    var id: Int
    var name: String
    var age: String?
    var image: String?
    var gender: String?
    var hairColor: String?
    var occupation: String?
    var firstEpisode: String?
    var voicedBy: String?
    var url: String?
    var wikiUrl: String?
    var relatives: [RelativeModel]
    
    //used to make struct Equatable so can run onChange to scroll to top when selecting relative character
    static func ==(lhs: CharacterModel, rhs: CharacterModel) -> Bool {
        return lhs.name == rhs.name && lhs.id == rhs.id
    }
    
    var voicedByArray: [VoicedBy]? {
        return voicedBy?.characterVoicedBy
    }
}
