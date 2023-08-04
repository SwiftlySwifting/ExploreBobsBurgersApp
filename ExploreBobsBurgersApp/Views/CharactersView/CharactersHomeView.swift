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
            GridItem(.flexible(), spacing: 5),
            GridItem(.flexible(), spacing: 5)
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
                .padding(.leading)
                
                CharactersSubViewTitle(title:  CategoriesEnum.characters.label)
            }
            .padding(.bottom, 30)
            .background {
                Color.bBBlue.ignoresSafeArea()
            }
            
            ScrollViewReader {proxy in
                ScrollView {
                    LazyVGrid(columns: columns) {
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
                }
                .onAppear {
                    if vm.selectedCharModel != nil {
                        proxy.scrollTo(vm.selectedCharModel!.id,
                                       anchor: .top)
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
