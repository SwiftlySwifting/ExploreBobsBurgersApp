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
            //Title and button
            ZStack {
                HStack {
                    Button {
                        vm.currentViewState = .home
                    } label: {
                        NavigationButton(label: Constants.sfBack)
                    }
                    Spacer()
                    
                    Button {
                        Task {
                            await vm.fetchAllCharacters()
                        }
                    } label: {
                        Text("fetch")
                    }
                }
                .padding(.leading)
                
                HomeViewLabel(label: CategoriesEnum.characters.label)
            }
            .padding(.bottom, 30)
            .background {
                Color.bBBlue.ignoresSafeArea()
            }
        
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(vm.allCharacters) {char in
                        Button {
                            vm.selectedCharModel = char
                            if vm.selectedCharModel != nil {
                                vm.currentViewState = .characterInfo
                            }
                            
                        } label: {
                            CharactersHomeListCellView(character: char)
                        }
                    
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
