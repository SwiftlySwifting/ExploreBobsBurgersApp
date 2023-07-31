//
//  Constants.swift
//  ExploreBobsBurgersApp
//
//  Created by Scriffles on 7/27/23.
//

import Foundation

struct Constants {
    static let imageBbBgBlueStr = "bBBgBlue"
    static let imageBbLogoStr = "bBLogo"
    
    static let fontStr = "ShortStack"
    
    static let sfHome = "house.fill"
    static let sfBack = "arrow.backward"
    
    static let BASE_URL = "https://bobsburgers-api.herokuapp.com/"
    static let CHAR_URL = BASE_URL + "characters"
    
    static let previewCharacterModel = CharacterModel(id: 1,
                                                      name: "Andy and Olli Popopolovitch",
                                                      image: "char1",
                                                      gender: "Female",
                                                      hairColor: "Blonde",
                                                      occupation: "Student at Wagstaff School",
                                                      firstEpisode: "The Kids Run the Restaurant",
                                                      voicedBy: "Wendy Molyneux",
                                                      url: "https://bobsburgers-api.herokuapp.com/characters/1",
                                                      wikiUrl: "https://bobs-burgers.fandom.com/wiki/%22Dottie_Minerva%22",
                                                      relatives: [])
}

enum CategoriesEnum: CaseIterable {
    case characters
    case episodes
    case favorites
    
    var imageStr: String {
        switch self {
        case .characters: return "bBCatCharacters_v1_1080"
        case .episodes: return "bBCatEpisodes_v1_1080"
        case .favorites: return "bBCatFavorites_v1_1080"
        }
    }
    
    var label: String {
        switch self {
        case .characters: return "Characters"
        case .episodes: return "Episodes"
        case .favorites: return "Favorites"
        }
    }
}

enum ViewStateEnum {
    case home
    case characters
    case characterInfo
    case episodes
    case favorites
}

enum NetworkError: Error {
    case badRequest
    case unsupportedImage
    case badUrl
}
