//
//  EpisodesHomeView.swift
//  ExploreBobsBurgersApp
//
//  Created by Scriffles on 8/9/23.
//

import SwiftUI

struct EpisodesHomeView: View {
    
    @EnvironmentObject private var vm: ViewModel

    var body: some View {
        VStack {
            ZStack {
                HStack {
                    Button {
                        vm.currentViewState = .home
                    } label: {
                        NavigationButton(label: Constants.sfBack)
                    }
                    
                    Spacer()
                }
                .padding(.horizontal)

                CharactersSubViewTitle(title: CategoriesEnum.episodes.label)
            }
            .padding(.bottom, 30)
            .background {
                Color.bBBlue.ignoresSafeArea()
            }
            
            Spacer()
        }
    }
}

struct EpisodesHomeView_Previews: PreviewProvider {
    static var previews: some View {
        EpisodesHomeView().previewData()
        
    }
}
