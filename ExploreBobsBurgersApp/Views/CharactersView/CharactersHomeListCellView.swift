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
        
        
        ZStack {
            Color.bBBlue
                .aspectRatio(0.80, contentMode: .fit)
                .shadow(color: .shadowColor, radius: 3, x: 1, y: 1)
            
            GeometryReader { geo in
                Image(character.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: geo.size.width, height: geo.size.width, alignment: .top)
                    .clipped()
                    .background {
                        Color.white
                    }
            }
            
            .padding()
            
            VStack {
                Spacer()
                Text(character.name)
                    .font(.appCaption)
                    .foregroundColor(.white)
                    .padding(.bottom)
                    .multilineTextAlignment(.center)
                
            }
        }
        .padding()
    }
}

struct CharactersHomeListCellView_Previews: PreviewProvider {
    static var previews: some View {
        CharactersHomeListCellView(character: Constants.previewCharacterModel)
    }
}
