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
//                .transition(AnyTransition.move(edge: .leading))
        case .characters:
            CharactersHomeView()
//                .transition(AnyTransition.move(edge: .leading))
        case .episodes:
            EmptyView()
        case .favorites:
            EmptyView()
        }
    }
}

struct SwitchContainerView_Previews: PreviewProvider {
    static var previews: some View {
        SwitchContainerView()
    }
}
