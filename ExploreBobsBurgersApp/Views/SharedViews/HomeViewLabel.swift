//
//  HomeViewLabel.swift
//  ExploreBobsBurgersApp
//
//  Created by Scriffles on 7/27/23.
//

import SwiftUI

struct HomeViewLabel: View {
    
    var label: String
    
    var body: some View {
        Text(label)
            .font(.appTitle3)
            .foregroundColor(.bBRed)
            .padding()
            .background {
                Rectangle()
                    .foregroundColor(.white)
                    .shadow(color: .shadowColor, radius: 3, x: 1, y: 1)
            }
    }
}

struct HomeViewLabel_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewLabel(label: "Explore")
    }
}
