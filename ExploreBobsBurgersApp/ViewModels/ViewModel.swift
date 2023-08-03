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
        if let id = characterIdFromRelativeUrl(relative: relative) {
            let suffix = ".jpg"
            return Constants.IMAGE_URL + id + suffix
        } else {
            let chars = allCharacters.filter { char in
                relative.name == char.name &&
                compareName(relModels: char.relatives, selectedName: selectedCharModel!.name)
            }.first
            
            if chars != nil {
                if chars!.image != nil {
                    return chars!.image!
                } else { return nil }
            } else {return nil }
        }
    }
    
    //For when RelativeModel does not have API url, but the Relative does have a ChracterModel
    func compareName(relModels:[RelativeModel], selectedName: String) -> Bool {
        var str = [String]()
        let selNamePartsArray = selectedName.nameSplitLowerCase
        for relModel in relModels {
            let relNamePartsArray = relModel.name.nameSplitLowerCase
            for relNamePart in relNamePartsArray {
                if selNamePartsArray.contains(relNamePart) {
                    str.append(relNamePart)
                }
            }
        }
        if str.isEmpty {
            return false
        } else { return true }
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
