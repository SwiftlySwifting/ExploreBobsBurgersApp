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
//            for a in allChars {
//                if let b = a.voicedBy {
//                    print("\(a.name): \(b)")
//                }
//            }
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
    
    func characterModelFromRelative(relative:RelativeModel) -> CharacterModel? {
        if let chars = allCharacters.filter({ char in
            relative.name == char.name &&
            compareName(relModels: char.relatives, selectedName: selectedCharModel!.name)
        }).first {
            return chars
        } else { return nil }
    }
    
    func imageUrlStrFromRelative(relative: RelativeModel) -> String? {
        if let id = characterIdFromRelativeUrl(relative: relative) {
            let suffix = ".jpg"
            return Constants.IMAGE_URL + id + suffix
        } else {
            if let chars = characterModelFromRelative(relative: relative) {
                if let image = chars.image {
                    return image
                } else { return nil }
            } else { return nil }
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
        if let unwrappedUrlStr = relative.url {
            if let url = URL(string: unwrappedUrlStr) {
                return url.lastPathComponent
            } else { return nil }
        } else { return nil }
    }
    
    func fetchCharacterFromRelative(relative: RelativeModel) {
        if let id = characterIdFromRelativeUrl(relative: relative) {
            guard let char = (allCharacters.first { char in
                char.id == Int(id)
            }) else { return }
            selectedCharModel = char
        } else {
            guard let char = characterModelFromRelative(relative: relative) else { return }
            selectedCharModel = char
        }
    }
    
    func isCharWikiUrlValid() -> Bool {
        if selectedCharModel != nil {
            if selectedCharModel!.wikiUrl != nil {
                return true
            } else { return false }
        } else { return false }
    }
    
}
