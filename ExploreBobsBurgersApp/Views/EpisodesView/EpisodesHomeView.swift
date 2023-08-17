//
//  EpisodesHomeView.swift
//  ExploreBobsBurgersApp
//
//  Created by Scriffles on 8/9/23.
//

import SwiftUI

struct EpisodesHomeView: View {
    
    @EnvironmentObject private var vm: ViewModel
    @Environment(\.openURL) private var openUrl
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                HStack {
                    Button {
                        vm.currentViewState = .home
                    } label: {
                        NavigationButton(label: Constants.sfBack, color: .white)
                    }
                    
                    Spacer()
                }
                .padding(.horizontal)
                
                CharactersSubViewTitle(title: CategoriesEnum.episodes.label)
            }
            .padding(.bottom, 30)
            .background {
                Color.bBBlue.ignoresSafeArea()
                    .padding(.bottom)
            }
            
            ScrollView {
                LazyVStack(alignment: .center,
                           spacing: 10,
                           pinnedViews: .sectionHeaders) {
                    ForEach(0..<vm.allSeasons.count, id: \.self) { index in
                        Section {
                            if vm.allSeasons[index].expandEpis {
                                VStack(alignment: .leading, spacing: 10) {
                                    ForEach(vm.allSeasons[index].orderFilterEpis) { e in
                                        Button {
                                            vm.selectedEpisode = e
                                            vm.currentViewState = .episodeInfo
                                        } label: {
                                            EpisodeCell(episode: e)
                                                .padding(.horizontal)
                                        }
                                        .buttonStyle(.plain)
                                    }
                                }
                            }
                        } header: {
                            EpisodeHeader(season: vm.allSeasons[index],
                                          showEpisodes: $vm.allSeasons[index].expandEpis)
                      
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
