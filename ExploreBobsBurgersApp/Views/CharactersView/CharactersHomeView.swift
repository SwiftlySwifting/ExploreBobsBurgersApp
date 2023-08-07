//
//  CharactersHomeView.swift
//  ExploreBobsBurgersApp
//
//  Created by Scriffles on 7/28/23.
//

import SwiftUI

struct CharactersHomeView: View {
    
    @EnvironmentObject private var vm: ViewModel
    
    private var columns:[GridItem] {
        let columns = [
            GridItem(.flexible(), spacing: 20),
            GridItem(.flexible(), spacing: 20)
        ]
        return columns
    }
    
    var body: some View {
        VStack {
            ZStack {
                HStack {
                    Button {
                        vm.currentViewState = .home
                    } label: {
                        NavigationButton(label: Constants.sfBack)
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
                        .padding(.horizontal)
                        .padding(.bottom)
                        .id(0)
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(vm.allCharacters) {char in
                            ZStack {
                                Button {
                                    vm.selectedCharModel = char
                                    if vm.selectedCharModel != nil {
                                        vm.currentViewState = .characterInfo
                                    }
                                    
                                } label: {
                                    CharactersHomeListCellView(character: char)
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
                                       anchor: .top)
                    } else {
                        proxy.scrollTo(0, anchor: .top)
                    }
                }
            }

            Spacer()
        }
    }
}

struct CharactersHomeView_Previews: PreviewProvider {
    static var previews: some View {
        CharactersHomeView()
            .previewData()
    }
}
