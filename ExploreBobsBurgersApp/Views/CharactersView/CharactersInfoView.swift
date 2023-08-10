//
//  CharactersInfoView.swift
//  ExploreBobsBurgersApp
//
//  Created by Scriffles on 7/31/23.
//

import SwiftUI

struct CharactersInfoView: View {
    
    @EnvironmentObject private var vm: ViewModel
    @EnvironmentObject private var cdVM: CoreDataViewModel
    @Environment(\.openURL) private var openUrl
    @Environment(\.managedObjectContext) private var context

    var body: some View {
        
        VStack(spacing: 0) {
            
            HStack(alignment: .top) {
                Button {
                    vm.currentViewState = .characters
//                    cdVM.clearCharacter()
                } label: {
                    NavigationButton(label: Constants.sfBack, color: .white)
                }
                Spacer()
                
                CharactersSubViewTitle(title: vm.selectedCharModel!.name)
                
                Spacer()
                
                Button {
                    Task {
                        vm.currentViewState = .home
//                        cdVM.clearCharacter()
                    }
                } label: {
                    NavigationButton(label: Constants.sfHome, color: .white)
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
                                    NavigationButton(label: Constants.sfWiki, color: .white)
                                }
                                .opacity(vm.isCharWikiUrlValid() ? 1 : 0)
                                .disabled(!vm.isCharWikiUrlValid())
                                
                                Spacer()
                                
                                ZStack {
                                    if cdVM.isCharacterFavorite(context: context,
                                                                character: cdVM.selectedCharModel!) {
                                        Button {
                                            cdVM.loadCharacter(character: vm.selectedCharModel!)
                                            cdVM.deleteFavCharacter(context: context)
                                        } label: {
                                            NavigationButton(label: Constants.sfHeartFill, color: .bBRed)
                                        }
                                    } else {
                                        Button {
                                            cdVM.loadCharacter(character: vm.selectedCharModel!)
                                            cdVM.createNewFavCharacter(context: context)
                                        } label: {
                                            NavigationButton(label: Constants.sfHeart, color: .white)
                                        }
                                    }
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
        }
        
    }
}

struct CharactersInfoView_Previews: PreviewProvider {
    static var previews: some View {
        CharactersInfoView()
            .previewData()
    }
}
