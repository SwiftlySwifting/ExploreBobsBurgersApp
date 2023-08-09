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
    static let sfPerson = "person"
    static let sfHeartFill = "heart.fill"
    static let sfHeart = "heart"
    static let sfWiki = "safari"
    static let sfMagnifyingglass = "magnifyingglass"
    static let sfClearSearch = "x.circle"
    
    static let BASE_URL = "https://bobsburgers-api.herokuapp.com/"
    static let CHAR_URL = BASE_URL + "characters"
    static let IMAGE_URL = BASE_URL + "images/characters/"
    static let EPI_URL = BASE_URL + "episodes"
    
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
                                                      relatives: [previewRelativesModelA, previewRelativesModelB])
    
    static let previewRelativesModelA = RelativeModel(id: "64c95b92260cf27ca69c0219",
                                                      name: "Gloria Genarro",
                                                      wikiUrl: "https://bobs-burgers.fandom.com/wiki/Gloria_Genarro",
                                                      relationship: "wife",
                                                      url: "https://bobsburgers-api.herokuapp.com/characters/178")
    
    static let previewRelativesModelB = RelativeModel(id: "64c95b92260cf27ca69c021a",
                                                      name: "Linda Belcher",
                                                      wikiUrl: "https://bobs-burgers.fandom.com/wiki/Linda_Belcher",
                                                      relationship: "older daughter",
                                                      url: "https://bobsburgers-api.herokuapp.com/characters/275")
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
