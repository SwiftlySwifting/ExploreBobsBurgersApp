//
//  CharactersHomeView.swift
//  ExploreBobsBurgersApp
//
//  Created by Scriffles on 7/28/23.
//

import SwiftUI

struct CharactersHomeView: View {
    
    @EnvironmentObject private var vm: ViewModel

    var body: some View {
        VStack {
            Text("CharterView")
            Button("Back") {
                vm.currentViewState = .home
            }

        }
    }
}

struct CharactersHomeView_Previews: PreviewProvider {
    static var previews: some View {
        CharactersHomeView()
    }
}
