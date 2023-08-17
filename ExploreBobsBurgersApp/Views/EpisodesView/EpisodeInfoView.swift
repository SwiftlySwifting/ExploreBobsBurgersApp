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
        
        VStack {
            Button {
                vm.currentViewState = .episodes
            } label: {
                Text("Back")
            }
            
            Text("name: \(vm.selectedEpisode!.name)")
            Text("season: \(vm.selectedEpisode!.season)")
            Text("epi: \(vm.selectedEpisode!.episode)")
            if vm.filteredStoreNextDoorFromEpisode() != nil {
                ForEach(vm.filteredStoreNextDoorFromEpisode()!) { store in
                    Text("SND Title: \(store.name!)")
                    Text("SND season: \(store.season)")
                    Text("SND epi: \(store.episode)")
                }
            }
        }
    }
}

struct EpisodeInfoView_Previews: PreviewProvider {
    static var previews: some View {
        EpisodeInfoView()
            .previewData()
    }
}
