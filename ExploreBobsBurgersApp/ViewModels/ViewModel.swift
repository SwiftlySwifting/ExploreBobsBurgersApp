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
        guard let id = characterIdFromRelativeUrl(relative: relative) else {
            return nil
        }
        let suffix = ".jpg"
        return Constants.IMAGE_URL + id + suffix
    }
    
    func characterIdFromRelativeUrl(relative: RelativeModel) -> String? {
        guard let unwrappedUrlStr = relative.url else {
            return nil
        }
        guard let url = URL(string: unwrappedUrlStr) else {
            return nil
        }
        return url.lastPathComponent
    }
    
    func fetchCharacterFromRelative(relative: RelativeModel) {
        guard let id = characterIdFromRelativeUrl(relative: relative) else { return }
        guard let char = (allCharacters.first { char in
            char.id == Int(id)
         }) else { return }
        selectedCharModel = char
    }
    
    func isCharWikiUrlValid() -> Bool {
        if selectedCharModel != nil {
            if selectedCharModel!.wikiUrl != nil {
                return true
            } else { return false }
        } else { return false }
    }
    
}
