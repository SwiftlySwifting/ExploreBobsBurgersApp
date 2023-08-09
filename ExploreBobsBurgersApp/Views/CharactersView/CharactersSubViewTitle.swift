//
//  CharactersSubViewTitle.swift
//  ExploreBobsBurgersApp
//
//  Created by Scriffles on 7/31/23.
//

import SwiftUI

struct CharactersSubViewTitle: View {
    
    var title: String
    
    var body: some View {
        
        Text(title)
            .font(.appTitle2)
            .foregroundColor(.white)
            .multilineTextAlignment(.center)
            .padding(.horizontal)
    }
}

struct CharactersSubViewTitle_Previews: PreviewProvider {
    static var previews: some View {
        CharactersSubViewTitle(title: "Characters")
    }
}
