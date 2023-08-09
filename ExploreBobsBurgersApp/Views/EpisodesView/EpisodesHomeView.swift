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
        VStack(spacing: 0) {
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
            
            ScrollView {
                VStack {
                    ForEach(vm.allSeasons) { s in
                        Section {
                            VStack(alignment: .leading) {
                                ForEach(s.orderFilterEpis) { e in
                                    EpisodeCell(episode: e)
                                        .padding(.horizontal)
                                }
                            }
                        } header: {
                            ZStack {
                                Rectangle()
                                    .frame(height: 30)
                                    .foregroundColor(.bBRed)
                                Text("Season \(s.number)")
                                    .font(.appTitle2)
                                    .foregroundColor(.white)
                            }
                            .padding(.top)
                        }
                    }
                }
            }
        }
    }
}

//struct EpisodesHomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        EpisodesHomeView().previewData()
//
//    }
//}
