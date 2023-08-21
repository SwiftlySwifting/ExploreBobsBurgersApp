//
//  EpisodeInfoView.swift
//  ExploreBobsBurgersApp
//
//  Created by Scriffles on 8/17/23.
//

import SwiftUI

struct EpisodeInfoView: View {
    
    @EnvironmentObject private var vm: ViewModel
    @Environment(\.openURL) private var openUrl

    var body: some View {
        
        VStack(spacing: 0) {
            VStack(spacing: 0) {
                HStack {
                    Button {
                        vm.currentViewState = .episodes
                    } label: {
                        NavigationButton(label: Constants.sfBack, color: .white)
                    }
                    
                    Spacer()
                    
                    CharactersSubViewTitle(title: "S:\(vm.selectedEpisode!.season) E:\(vm.selectedEpisode!.episode)")
                    
                    Spacer()
                                        
                    Button {
                        Task {
                            vm.currentViewState = .home
                        }
                    } label: {
                        NavigationButton(label: Constants.sfHome, color: .white)
                    }
                }
                
                CharactersSubViewTitle(title: vm.selectedEpisode!.name)
                
                HStack {
                    
                    Button {
                        openUrl(vm.selectedEpisode!.wikiUnwrappedUrl)
                    } label: {
                        NavigationButton(label: Constants.sfWiki, color: .white)
                    }
                    
                    Spacer()
                }
                
            }
            .padding(.horizontal)
            .padding(.bottom, 30)
            .background {
                Color.bBBlue.ignoresSafeArea()
            }
            
            ScrollView {
                VStack(spacing: 20) {
                    if vm.selectedEpisode!.productionCode != nil {
                        HStack {
                            Text("Production Code:")
                            Spacer()
                            Text(vm.selectedEpisode!.productionCode!)
                        }
                    }
                    
                    if vm.selectedEpisode!.airDate != nil {
                        HStack {
                            Text("Air Date:")
                            Spacer()
                            Text(vm.selectedEpisode!.airDate!)
                        }
                    }

                    HStack {
                        Text("Total Viewers:")
                        Spacer()
                        Text(vm.selectedEpisode!.totalViewers)
                    }
                    
                    if vm.isStoreNextDoorValid() {
                        VStack(spacing: 0) {
                            Divider()
                                .padding(.bottom)
                            Text("Store Next Door")
                            ForEach(vm.filteredStoreNextDoorFromEpisode()!) {snd in
                                if snd.image != nil {
                                    UrlImageStoreNextDoor(urlString: snd.image!)
                                        .scaledToFill()
                                        .background {
                                            Color.white
                                        }
                                        .padding()
                                        .padding(.horizontal)
                                }
                            }
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.top)

            }
            .font(.appBody)
            
        }
    }
}

struct EpisodeInfoView_Previews: PreviewProvider {
    static var previews: some View {
        EpisodeInfoView()
            .previewData()
    }
}
