//
//  HomeView.swift
//  ExploreBobsBurgersApp
//
//  Created by Scriffles on 7/27/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            Image(Constants.imageBbBgBlueStr)
                .resizable()
                .ignoresSafeArea()
            
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
                ScrollView {
                    ForEach(CategoriesEnum.allCases, id: \.self) {cat in
                        CategoryView(category: cat)
                    }
                }
                
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
