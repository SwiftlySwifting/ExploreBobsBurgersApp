//
//  CharactersInfoView.swift
//  ExploreBobsBurgersApp
//
//  Created by Scriffles on 7/31/23.
//

import SwiftUI

struct CharactersInfoView: View {
    
    @EnvironmentObject private var vm: ViewModel
        
    var body: some View {
        
        VStack {
            Button {
                vm.currentViewState = .characters
            } label: {
                Text("Back")
            }

            Text(vm.selectedCharModel!.name)

        }
    }
}

struct CharactersInfoView_Previews: PreviewProvider {
    static var previews: some View {
        CharactersInfoView()
            .previewData()
    }
}
