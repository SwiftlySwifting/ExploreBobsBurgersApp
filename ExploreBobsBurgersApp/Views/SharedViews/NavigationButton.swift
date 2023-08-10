//
//  NavigationButton.swift
//  ExploreBobsBurgersApp
//
//  Created by Scriffles on 7/28/23.
//

import SwiftUI

struct NavigationButton: View {
    
    var label: String
    var color: Color
    
    var body: some View {
        Image(systemName: label)
            .font(.appHomeTitle)
            .foregroundColor(color)
        
    }
}

struct NavigationButton_Previews: PreviewProvider {
    static var previews: some View {
        NavigationButton(label: Constants.sfHome, color: .white)
    }
}
