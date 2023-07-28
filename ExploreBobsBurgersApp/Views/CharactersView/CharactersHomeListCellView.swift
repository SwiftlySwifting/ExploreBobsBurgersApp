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
                .aspectRatio(0.85, contentMode: .fit)
                .shadow(color: .shadowColor, radius: 3, x: 1, y: 1)
            
            VStack {
                GeometryReader { geo in
                    Image(character.image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: geo.size.width, height: geo.size.width, alignment: .top)
                        .clipped()
                        .background {
                            Color.white
                        }
                        .frame(width: geo.size.width, height: geo.size.height)

                }
                .padding()
  
                Text(character.name)
                    .font(.appCaption)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.bottom)
                    .padding(.horizontal, 5)
            }
        }
        .padding(.all, 10)
    }
}

struct CharactersHomeListCellView_Previews: PreviewProvider {
    static var previews: some View {
        CharactersHomeListCellView(character: Constants.previewCharacterModel)
    }
}
