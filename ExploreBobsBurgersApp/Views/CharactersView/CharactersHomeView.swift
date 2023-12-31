//
//  CharactersHomeView.swift
//  ExploreBobsBurgersApp
//
//  Created by Scriffles on 7/28/23.
//

import SwiftUI

struct CharactersHomeView: View {
    
    @EnvironmentObject private var vm: ViewModel
    @EnvironmentObject private var cdVM: CoreDataViewModel
    @Environment(\.managedObjectContext) private var context
    
    private var columns:[GridItem] {
        let columns = [
            GridItem(.flexible(), spacing: 20),
            GridItem(.flexible(), spacing: 20)
        ]
        return columns
    }
    
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

                CharactersSubViewTitle(title:  CategoriesEnum.characters.label)
            }
            .padding(.bottom, 30)
            .background {
                Color.bBBlue.ignoresSafeArea()
            }
            
            ScrollViewReader {proxy in
                ScrollView {
                    CharactersSearchBarView()
                        .padding()
                        .id(0)
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(vm.searchedCharacters(fetchedCharsEnts: cdVM.fetchAllCharacters(context: context))) {char in
                            ZStack {
                                Button {
                                    vm.selectedCharModel = char
                                    if vm.selectedCharModel != nil {
                                        cdVM.loadCharacter(character: char)
                                        vm.currentViewState = .characterInfo
                                    }
                                    
                                } label: {
                                    CharactersHomeListCellView(character: char,
                                                               isFav: cdVM.isCharacterFavorite(context: context,
                                                                                               character: char))
                                }
                            }
                            .id(char.id)
                        }
                    }
                    .padding(.horizontal)
                }
                .onAppear {
                    if vm.selectedCharModel != nil {
                        proxy.scrollTo(vm.selectedCharModel!.id,
                                       anchor: .center)
                    } else {
                        proxy.scrollTo(0, anchor: .top)
                    }
                }
            }
        }
    }
}

struct CharactersHomeView_Previews: PreviewProvider {
    static var previews: some View {
        CharactersHomeView()
            .previewData()
    }
}
