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
        
        HStack {
            ZStack {
                Rectangle()
                    .frame(height: 40)
                    .foregroundColor(.gray.opacity(0.2))
                HStack {
                    Image(systemName: Constants.sfMagnifyingglass)
                        .foregroundColor(.gray.opacity(0.6))
                        .padding(.trailing, 5)
                    TextField("CharacterSearch",
                              text: $vm.characterSearch,
                              prompt: Text("Search"))
                    .font(.appBody)
                    
                    Spacer()
                    
                    Button {
                        vm.clearCharacterSearch()
                    } label: {
                        Image(systemName: Constants.sfClearSearch)
                            .foregroundColor(.gray.opacity(0.6))
                    }
                }
                .padding(.horizontal)
            }
            
            ZStack {
                if vm.showFavoriteCharacters {
                    Button {
                        vm.showFavoriteCharacters.toggle()
                    } label: {
                        Image(systemName: Constants.sfHeartFill)
                            .foregroundColor(.bBRed)
                            .font(.appTitle)
                    }
                } else {
                    Button {
                        vm.showFavoriteCharacters.toggle()
                    } label: {
                        Image(systemName: Constants.sfHeart)
                            .foregroundColor(.bBRed)
                            .font(.appTitle)

                    }
                }
            }
            .padding(.leading)
            .buttonStyle(.plain)
        }
    }
}

struct CharactersSearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        CharactersSearchBarView()
            .previewData()
    }
}
