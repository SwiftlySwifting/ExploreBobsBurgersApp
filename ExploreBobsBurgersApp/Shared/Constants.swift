//
//  Constants.swift
//  ExploreBobsBurgersApp
//
//  Created by Scriffles on 7/27/23.
//

import Foundation

struct Constants {
    public static let imageBbBgBlueStr = "bBBgBlue"
    public static let imageBbLogoStr = "bBLogo"
    
    public static let fontStr = "ShortStack-Regular.ttf"
}

enum CategoriesEnum: CaseIterable {
    case characters
    case episodes
    case favorites
    
    var image: String {
        switch self {
        case .characters: return ""
        case .episodes: return ""
        case .favorites: return ""
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
