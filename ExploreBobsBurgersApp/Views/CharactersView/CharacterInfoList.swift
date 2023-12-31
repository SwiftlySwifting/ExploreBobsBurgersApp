//
//  CharacterInfoList.swift
//  ExploreBobsBurgersApp
//
//  Created by Scriffles on 7/31/23.
//

import SwiftUI

struct CharacterInfoList: View {
    
    var character: CharacterModel
    
    var body: some View {
        
        VStack(spacing: 25) {
            if character.age != nil {
                CharacterInfoListStyle(label: "Age",
                                       info: character.age!.ageFormat)
            }
            if character.gender != nil {
                CharacterInfoListStyle(label: "Gender",
                                       info: character.gender!)
            }
            
            if character.occupation != nil {
                CharacterInfoListStyle(label: "Occupation",
                                       info: character.occupation!)
            }
            
            if character.firstEpisode != nil {
                CharacterInfoListStyle(label: "First Episode",
                                       info: character.firstEpisode!)
            }
            
            if character.voicedBy != nil {
                VStack {
                    Text("Voiced By:")
                        .font(.appBody)
                    if character.voicedByArray != nil {
                        VStack(spacing: 15) {
                            ForEach(character.voicedByArray!) {act in
                                VStack {
                                    Text(act.name)
                                        .font(.appTitle2)
                                    if act.episode != nil {
                                        Text(act.episode!)
                                            .font(.appCallout)
                                    }
                                }
                                .multilineTextAlignment(.center)
                            }
                        }
                    }
                }
            }
            
            if !character.relatives.isEmpty {
                VStack(spacing: 10) {
                    Text("Relatives:")
                        .font(.appBody)
                    CharactersRelativeView(character: character)
                }
                
            }
        }
        .padding(.horizontal)
    }
}

struct CharacterInfoList_Previews: PreviewProvider {
    static var previews: some View {
        CharacterInfoList(character: Constants.previewCharacterModel)
            .previewData()
    }
}
