//
//  ViewModel.swift
//  ExploreBobsBurgersApp
//
//  Created by Scriffles on 7/28/23.
//

import Foundation
import CoreData

@MainActor
class ViewModel: ObservableObject {
    
    @Published var currentViewState: ViewStateEnum = .home
    @Published var allCharacters:[CharacterModel] = []
    @Published var selectedCharModel: CharacterModel?
    @Published var characterSearch = ""
    @Published var showFavoriteCharacters = false
    
    @Published var allSeasons: [SeasonModel] = []
    @Published var selectedEpisode: EpisodeModel?
    
    @Published var allStoreNextDoors:[StoreNextDoorModel] = []
    
    init() {
        Task {
            await fetchAllCharacters()
            await fetchAllEpisodes()
            await fetchAllStoreNextDoor()
        }
    }
    
    func fetchAllCharacters() async {
        do {
            allCharacters = try await Webservice().getAllCharacters()
        }
        catch {
            print(error)
        }
    }
    
    func fetchAllEpisodes() async {
        do {
            var seasons = [SeasonModel]()
            //fetch Episodes
            var allEpis = try await Webservice().getAllEpisodes()
            
            //remove duplicate season 8 episode 7 models
            allEpis.removeAll { epiMod in
                return epiMod.season == 8 && epiMod.episode == 7
            }
            
            //add correct models
            allEpis.append(Constants.epiModels8e6)
            allEpis.append(Constants.epiModels8e7)
            
            //sort models and get last season number
            guard let lastEipSeasonNum = allEpis.sorted(by: { a, b in
                b.season > a.season
            }).last?.season else { return }
            
            //loop thorugh season count and create SeasonModel
            for s in 1..<(lastEipSeasonNum + 1) {
                let seasonEpis = allEpis.filter { epi in
                    epi.season == s
                }
                seasons.append(SeasonModel(id: UUID(),
                                           number: s,
                                           episodes: seasonEpis,
                                           expandEpis: false))
            }
            allSeasons = seasons
        }
        catch {
            print(error)
        }
    }
    
    func fetchAllStoreNextDoor() async {
        do {
            var allSnds = try await Webservice().getAllStoreNextDoor()
            
            allSnds.removeAll { snd in
                snd.season == 8 && snd.episode == 7
            }
            
            allSnds.append(Constants.sndModels8e7)
            allSnds.append(Constants.sndModels8e6)
            
            allStoreNextDoors = allSnds
                        
        } catch {
            print(error)
        }
    }
    
    func filteredStoreNextDoorFromEpisode() -> [StoreNextDoorModel]? {
        if selectedEpisode != nil {
            return allStoreNextDoors.filter({ snd in
                snd.episode == selectedEpisode!.episode && snd.season == selectedEpisode!.season
            })
        } else {
            return nil
        }
    }
    
    func clearCharacterSearch() {
        characterSearch = ""
    }
    
    func searchedCharacters(fetchedCharsEnts: [FavCharacterEnt]) -> [CharacterModel] {
        
        if showFavoriteCharacters {
            
            var favCharacters = [CharacterModel]()
            for model in allCharacters {
                for ent in fetchedCharsEnts {
                    if model.id == ent.id {
                        favCharacters.append(model)
                    }
                }
            }
            
            if characterSearch == "" {
                return favCharacters
            } else {
                return characterSearchFilter(sourceCharModels: favCharacters,
                                             searchText: characterSearch)
            }
            
        } else {
            if characterSearch == "" {
                return allCharacters
            } else {
                return characterSearchFilter(sourceCharModels: allCharacters,
                                             searchText: characterSearch)
            }
        }
    }
    
    func characterSearchFilter(sourceCharModels: [CharacterModel], searchText: String) -> [CharacterModel] {
        return sourceCharModels.filter { char in
            char.name.lowercased().contains(searchText.lowercased()) ||
            char.unwrappedVoicedBy.lowercased().contains(searchText.lowercased())
        }
    }
    
    func changeCategoryViews(category: CategoriesEnum) {
        switch category {
        case .characters:
            currentViewState = .characters
        case .episodes:
            currentViewState = .episodes
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
    
    func isStoreNextDoorValid() -> Bool {
        if filteredStoreNextDoorFromEpisode() != nil && !filteredStoreNextDoorFromEpisode()!.isEmpty {
            return true
        } else {
           return false
        }
    }
    
}
