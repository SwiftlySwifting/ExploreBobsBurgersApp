//
//  CoreDataViewModel.swift
//  ExploreBobsBurgersApp
//
//  Created by Scriffles on 8/10/23.
//

import Foundation
import CoreData

@MainActor
class CoreDataViewModel: ObservableObject {
    
    @Published var selectedId: Int?
    @Published var selectedCharModel: CharacterModel?
    
    func loadCharacter(character: CharacterModel) {
        selectedCharModel = character
    }
    
    func clearCharacter() {
        selectedCharModel = nil
    }
    
    func createNewFavCharacter(context: NSManagedObjectContext) {
        
        guard let selectedChar = selectedCharModel else { return }
        let newFav = FavCharacterEnt(context: context)
        newFav.id = Int32(selectedChar.id)
        newFav.createDate = Date()
        
        do {
            try context.save()
            print("Saved new fav character")
        } catch {
            print(error)
        }
    }
    
    func deleteFavCharacter(context: NSManagedObjectContext) {
        
        guard let selectedChar = selectedCharModel else { return }
        let request = NSFetchRequest<FavCharacterEnt>(entityName: Constants.cdCharFavEntStr)
        request.predicate = NSPredicate(format: "id == %i", Int32(selectedChar.id))
        
        do {
            guard let favChar = try context.fetch(request).first else { return }
            context.delete(favChar)
            
            do {
                try context.save()
                print("Deleted fav character")
            }
            catch {
                print("Error deleting fav character: \(error)")
            }
        }
        catch {
            print("Error fetching for delete fav character: \(error)")
        }
    }
    
    func isCharacterFavorite(context: NSManagedObjectContext, character: CharacterModel) -> Bool {
        
        let request = NSFetchRequest<FavCharacterEnt>(entityName: Constants.cdCharFavEntStr)
        request.predicate = NSPredicate(format: "id == %i", Int32(character.id))
        
        do {
            let favChar = try context.fetch(request)
            if favChar.isEmpty {
                return false
            } else { return true }
        }
        catch {
            print("Error fetching for fav character: \(error)")
            return false
        }
    }
    
    func fetchAllCharacters(context: NSManagedObjectContext) -> [FavCharacterEnt] {
        let request = NSFetchRequest<FavCharacterEnt>(entityName: Constants.cdCharFavEntStr)
        do {
            let favChar = try context.fetch(request)
            return favChar
        }
        catch {
            print("Error fetching for fav character: \(error)")
            return []
        }
        
    }
    
//    func fetchAllCharacters2(context: NSManagedObjectContext, characters: [CharacterModel]) -> [CharacterModel] {
//        let request = NSFetchRequest<FavCharacterEnt>(entityName: Constants.cdCharFavEntStr)
//        do {
//            let favChar = try context.fetch(request)
//            let filtered = favChar.filter { ent in
//                ent.id == 2
//            }
//            return favChar
//        }
//        catch {
//            print("Error fetching for fav character: \(error)")
//            return []
//        }
//        
//    }

}
    
