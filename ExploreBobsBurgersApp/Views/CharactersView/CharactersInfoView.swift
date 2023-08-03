//
//  CharactersInfoView.swift
//  ExploreBobsBurgersApp
//
//  Created by Scriffles on 7/31/23.
//

import SwiftUI

struct CharactersInfoView: View {
    
    @EnvironmentObject private var vm: ViewModel
    @Environment(\.openURL) private var openUrl
    
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
            
            ScrollViewReader { proxy in
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
                        VStack {
                            Spacer()
                            HStack(alignment: .top) {
                                Button {
                                    openUrl(URL(string: vm.selectedCharModel!.wikiUrl!)!)
                                } label: {
                                    NavigationButton(label: Constants.sfWiki)
                                }
                                .opacity(vm.isCharWikiUrlValid() ? 1 : 0)
                                .disabled(!vm.isCharWikiUrlValid())
                                
                                Spacer()
                                Button {
                                    //TODO: Make Favoties
                                } label: {
                                    NavigationButton(label: Constants.sfHeartFill)
                                }
                            }
                        }
                        .font(.appTitle3)
                        .foregroundColor(.white)
                        .buttonStyle(.plain)
                        .padding(.all)
                    }
                    .id(0)
                    
                    CharacterInfoList(character: vm.selectedCharModel!)
                }
                .onChange(of: vm.selectedCharModel) { _ in
                    proxy.scrollTo(0, anchor: .top)
                }
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
