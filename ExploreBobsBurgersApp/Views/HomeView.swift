//
//  HomeView.swift
//  ExploreBobsBurgersApp
//
//  Created by Scriffles on 7/27/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            Text("Hello")
                .font(.custom(Constants.fontStr, size: 30))
                      
            Image(Constants.imageBbLogoStr)
                .resizable()
                .scaledToFit()
                .padding()
                      
            Spacer()
        }
        .background {
            Image(Constants.imageBbBgBlueStr)
                .resizable()
                .scaledToFill()
        }
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
