//
//  CharacterPlaceholderView.swift
//  ExploreBobsBurgersApp
//
//  Created by Scriffles on 8/2/23.
//

import SwiftUI

struct CharacterPlaceholderView: View {
    
    var body: some View {
        
        ZStack {
            Color.clear
                .aspectRatio(1, contentMode: .fit)
            Image(systemName: Constants.sfPerson)
                .resizable()
                .aspectRatio(1, contentMode: .fit)
                .padding()
                .foregroundColor(.gray.opacity(0.5))
        }
   
    }
}

struct CharacterPlaceholderView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterPlaceholderView()
    }
}
