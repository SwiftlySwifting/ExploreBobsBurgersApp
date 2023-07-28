//
//  ViewModel.swift
//  ExploreBobsBurgersApp
//
//  Created by Scriffles on 7/28/23.
//

import Foundation

@MainActor
class ViewModel: ObservableObject {
    
    @Published var currentViewState: ViewStateEnum = .home
    @Published var allCharacters:[CharacterModel] = []
    
    func fetchAllCharacters() async {
        do {
            let allChars = try await Webservice().getAllCharacters()
            allCharacters = allChars
        }
        catch {
            print(error)
        }
    }
    
    func changeViews(category: CategoriesEnum) {
        switch category {
        case .characters:
            currentViewState = .characters
        case .episodes:
            currentViewState = .episodes
        case .favorites:
            currentViewState = .favorites
        }
    }
    
}
