//
//  SwitchContainerView.swift
//  ExploreBobsBurgersApp
//
//  Created by Scriffles on 7/28/23.
//

import SwiftUI

struct SwitchContainerView: View {
    
    @EnvironmentObject private var vm: ViewModel
    
    var body: some View {
        switch vm.currentViewState {
        case .home:
            HomeView()
        case .characters:
            CharactersHomeView()
        case .characterInfo:
            CharactersInfoView()
        case .episodes:
            EpisodesHomeView()
        case .favorites:
            EmptyView()
        }
    }
}

struct SwitchContainerView_Previews: PreviewProvider {
    static var previews: some View {
        SwitchContainerView()
            .previewData()
    }
}
