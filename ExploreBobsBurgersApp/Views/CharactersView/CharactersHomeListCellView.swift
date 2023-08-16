//
//  CharactersHomeListCellView.swift
//  ExploreBobsBurgersApp
//
//  Created by Scriffles on 7/28/23.
//

import SwiftUI

struct CharactersHomeListCellView: View {
    
    var character: CharacterModel
    var isFav: Bool
    
    var body: some View {
        
        ZStack(alignment: .top) {
            Color.bBBlue
                .aspectRatio(0.80, contentMode: .fit)
                .shadow(color: .shadowColor, radius: 3, x: 1, y: 1)
            
            VStack {
                ZStack {
                    UrlImageCharacter(urlString: character.image)
                        .scaledToFill()
                        .frame(width: 150,
                               height: 150,
                               alignment: .top)
                        .clipped()
                        .background {
                            Color.white
                        }
                    VStack {
                        HStack {
                            Spacer()
                            if isFav {
                                NavigationButton(label: Constants.sfHeartFill, color: .red)
                            }
                        }
                        Spacer()
                    }
                    .padding(.all, 5)
                }
                .frame(width: 150,
                       height: 150,
                       alignment: .top)
                
                Spacer()
                
                Text(character.name)
                    .font(.appCaption)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                
                Spacer()
            }
            .padding(.all, 10)
        }
    }
}

struct CharactersHomeListCellView_Previews: PreviewProvider {
    static var previews: some View {
        CharactersHomeListCellView(character: Constants.previewCharacterModel,
                                   isFav: true)
    }
}
