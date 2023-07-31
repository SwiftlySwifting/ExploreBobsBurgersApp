//
//  CharactersHomeListCellView.swift
//  ExploreBobsBurgersApp
//
//  Created by Scriffles on 7/28/23.
//

import SwiftUI

struct CharactersHomeListCellView: View {
    
    var character: CharacterModel
    
    var body: some View {
        
        ZStack(alignment: .top) {
            Color.bBBlue
                .aspectRatio(0.80, contentMode: .fit)
                .shadow(color: .shadowColor, radius: 3, x: 1, y: 1)
            
            VStack {
                UrlImage(urlString: character.image)
                    .scaledToFill()
                    .frame(width: 150,
                           height: 150,
                           alignment: .top)
                    .clipped()
                    .background {
                        Color.white
                    }
                
                Spacer()
                
                Text(character.name)
                    .font(.appCaption)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                
                Spacer()
            }
            .padding(.all, 10)
        }
        .padding(.all, 10)
    }
}

struct CharactersHomeListCellView_Previews: PreviewProvider {
    static var previews: some View {
        CharactersHomeListCellView(character: Constants.previewCharacterModel)
    }
}
