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
            .font(.appHomeTitle)
            .foregroundColor(.bobRed)
            .background {
                Rectangle()
                    .frame(width: 225, height: 50)
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
