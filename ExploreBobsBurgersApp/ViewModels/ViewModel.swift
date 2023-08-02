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
    @Published var selectedCharModel: CharacterModel?
    
    init() {
        Task {
            await fetchAllCharacters()
        }
    }
    
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
    
    func relativeUrlStrFromCharacter(relative: RelativeModel) -> String? {
        
        guard let unwrappedUrlStr = relative.url else {
            return nil
        }
        
        guard let url = URL(string: unwrappedUrlStr) else {
            return nil
        }
        let suffix = ".jpg"
        return Constants.IMAGE_URL + url.lastPathComponent + suffix
    }
    
    func isCharWikiUrlValid() -> Bool {
        if selectedCharModel != nil {
            if selectedCharModel!.wikiUrl != nil {
                return true
            } else { return false }
        } else { return false }
    }
    
}
