//
//  NavigationButton.swift
//  ExploreBobsBurgersApp
//
//  Created by Scriffles on 7/28/23.
//

import SwiftUI

struct NavigationButton: View {
    
    var label: String
    
    var body: some View {
        ZStack {
//            Rectangle()
//                .frame(width: 50, height: 50)
//                .foregroundColor(.white)
//                .shadow(color: .shadowColor, radius: 3, x: 1, y: 1)
            Image(systemName: label)
                .font(.appHomeTitle)
                .foregroundColor(.white)
        }
    }
}

struct NavigationButton_Previews: PreviewProvider {
    static var previews: some View {
        NavigationButton(label: Constants.sfHome)
    }
}
