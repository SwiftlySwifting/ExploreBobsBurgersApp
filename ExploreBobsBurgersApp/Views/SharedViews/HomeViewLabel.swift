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
        ZStack {
            Rectangle()
                .frame(width: 225, height: 50)
                .foregroundColor(.white)
                .shadow(color: .shadowColor, radius: 3, x: 1, y: 1)
            Text(label)
                .font(.appHomeTitle)
                .foregroundColor(.bBRed)
        }
    }
}

struct HomeViewLabel_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewLabel(label: "Explore")
    }
}
