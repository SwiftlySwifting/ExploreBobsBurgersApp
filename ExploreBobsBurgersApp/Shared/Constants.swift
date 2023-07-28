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
    case episodes
    case favorites
}
