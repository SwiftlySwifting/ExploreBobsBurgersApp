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
            ZStack(alignment: .top) {
                Image(Constants.imageBbLogoStr)
                    .resizable()
                    .scaledToFit()
                HomeViewLabel(label: "Explore")
                    .offset(y: -30)
            }
            .padding(.top, 40)
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
