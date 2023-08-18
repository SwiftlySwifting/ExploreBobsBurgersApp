//
//  EpisodeInfoView.swift
//  ExploreBobsBurgersApp
//
//  Created by Scriffles on 8/17/23.
//

import SwiftUI

struct EpisodeInfoView: View {
    
    @EnvironmentObject private var vm: ViewModel

    var body: some View {
        
        VStack(spacing: 0) {
            ZStack(alignment: .top) {
                HStack {
                    Button {
                        vm.currentViewState = .episodes
                    } label: {
                        NavigationButton(label: Constants.sfBack, color: .white)
                    }
                    
                    Spacer()
                }
                .padding(.horizontal)
                
                VStack {
                    CharactersSubViewTitle(title: "S:\(vm.selectedEpisode!.season) E:\(vm.selectedEpisode!.episode)")
                    CharactersSubViewTitle(title: vm.selectedEpisode!.name)
                }
            }
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
                    
                    if vm.filteredStoreNextDoorFromEpisode() != nil {
                        ForEach(vm.filteredStoreNextDoorFromEpisode()!) {snd in
                            Text(snd.name!)
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
