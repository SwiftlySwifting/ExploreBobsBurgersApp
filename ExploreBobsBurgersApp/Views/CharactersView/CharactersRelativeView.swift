//
//  CharactersRelativeView.swift
//  ExploreBobsBurgersApp
//
//  Created by Scriffles on 8/1/23.
//

import SwiftUI

struct CharactersRelativeView: View {
    
    var character: CharacterModel
    
    var body: some View {
        
        LazyVStack(spacing: 10) {
            ForEach(character.relatives) {rel in
                CharactersRelativeCellView(relative: rel)
                
            }
        }
    }
}

struct CharactersRelativeView_Previews: PreviewProvider {
    static var previews: some View {
        CharactersRelativeView(character: Constants.previewCharacterModel)
    }
}
