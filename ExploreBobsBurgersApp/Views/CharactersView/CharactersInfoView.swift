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
        
        VStack(spacing: 0) {
            
            HStack(alignment: .top) {
                Button {
                    vm.currentViewState = .characters
                } label: {
                    NavigationButton(label: Constants.sfBack)
                }
                Spacer()
                
                CharactersSubViewTitle(title: vm.selectedCharModel!.name)
                
                Spacer()
                
                Button {
                    Task {
                        vm.currentViewState = .home
                    }
                } label: {
                    NavigationButton(label: Constants.sfHome)
                }
            }
            .padding(.horizontal)
            .padding(.bottom, 30)
            .background {
                Color.bBBlue.ignoresSafeArea()
            }
            
            ScrollView {
                ZStack(alignment: .top) {
                    
                    Color.bBBlue
                    
                    UrlImage(urlString: vm.selectedCharModel!.image)
                        .scaledToFill()
                        .frame(width: 200, alignment: .top)
                        .background {
                            Color.white
                        }
                        .padding(.vertical)
                }
                
                CharacterInfoList(character: vm.selectedCharModel!)
                
            }
            
            Spacer()
            
        }
    }
}

struct CharactersInfoView_Previews: PreviewProvider {
    static var previews: some View {
        CharactersInfoView()
            .previewData()
    }
}
