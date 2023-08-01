//
//  CharacterInfoStyle.swift
//  ExploreBobsBurgersApp
//
//  Created by Scriffles on 7/31/23.
//

import SwiftUI

struct CharacterInfoListStyle: View {
    
    var label: String
    var info: String
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            Text(label + ":")
                .font(.appBody)
            Text(info)
                .font(.appTitle2)
                .multilineTextAlignment(.center)
        }
    }
}

struct CharacterInfoListStyle_Previews: PreviewProvider {
    static var previews: some View {
        CharacterInfoListStyle(label: "Age", info: "70s")
    }
}
