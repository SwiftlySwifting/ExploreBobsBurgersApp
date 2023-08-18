//
//  HomeView.swift
//  ExploreBobsBurgersApp
//
//  Created by Scriffles on 7/27/23.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject private var vm: ViewModel
    
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
                        .shadow(color: .shadowColor, radius: 3, x: 1, y: 1)
                    HomeViewLabel(label: "Explore")
                        .offset(y: -30)
                }
                .padding(.top, 30)
                .padding()
                
                Spacer()
                
                ForEach(CategoriesEnum.allCases, id: \.self) {cat in
                    Button {
                        withAnimation {
                            vm.changeViews(category: cat)
                        }
                    } label: {
                        CategoryView(category: cat)
                            .padding(.vertical)
                    }
                }
                
                Spacer()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
