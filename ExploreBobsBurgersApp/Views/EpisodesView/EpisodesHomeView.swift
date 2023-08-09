//
//  EpisodesHomeView.swift
//  ExploreBobsBurgersApp
//
//  Created by Scriffles on 8/9/23.
//

import SwiftUI

struct EpisodesHomeView: View {
    
    @EnvironmentObject private var vm: ViewModel
    @Environment(\.openURL) private var openUrl
    
    var body: some View {
        VStack(spacing: 0) {
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
                
                CharactersSubViewTitle(title: CategoriesEnum.episodes.label)
            }
            .padding(.bottom, 30)
            .background {
                Color.bBBlue.ignoresSafeArea()
                    .padding(.bottom)
            }
            
            ScrollView {
                LazyVStack(alignment: .center,
                           spacing: 10,
                           pinnedViews: .sectionHeaders) {
                    ForEach(vm.allSeasons) { s in
                        Section {
                            VStack(alignment: .leading, spacing: 10) {
                                ForEach(s.orderFilterEpis) { e in
                                    Button {
                                        openUrl(e.wikiUrlObj)
                                    } label: {
                                        EpisodeCell(episode: e)
                                            .padding(.horizontal)
                                    }
                                    .buttonStyle(.plain)
                                }
                            }
                        } header: {
                            ZStack {
                                Rectangle()
                                    .frame(height: 30)
                                    .foregroundColor(.bBRed)
                                Text("Season \(s.number)")
                                    .font(.appTitle2)
                                    .foregroundColor(.white)
                            }
                        }
                    }

                }
                
            }
        }
    }
}

//struct EpisodesHomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        EpisodesHomeView().previewData()
//
//    }
//}
