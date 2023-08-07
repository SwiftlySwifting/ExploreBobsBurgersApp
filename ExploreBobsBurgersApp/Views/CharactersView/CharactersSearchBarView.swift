//
//  CharactersSearchBarView.swift
//  ExploreBobsBurgersApp
//
//  Created by Scriffles on 8/7/23.
//

import SwiftUI

struct CharactersSearchBarView: View {
    
    @EnvironmentObject private var vm: ViewModel
    
    var body: some View {
        
        ZStack {
            Rectangle()
                .frame(height: 40)
                .foregroundColor(.gray.opacity(0.2))
            HStack {
                Image(systemName: Constants.sfMagnifyingglass)
                    .foregroundColor(.gray.opacity(0.6))
                    .padding(.trailing, 5)
                Text(vm.characterSearch)
                    .font(.appBody)
                Spacer()
                
                Button {
                    
                } label: {
                    Image(systemName: Constants.sfClearSearch)
                        .foregroundColor(.gray.opacity(0.6))
                }
            }
            .padding(.horizontal)
        }
    }
}

struct CharactersSearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        CharactersSearchBarView()
            .previewData()
    }
}
