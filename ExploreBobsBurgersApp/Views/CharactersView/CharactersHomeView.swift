//
//  CharactersHomeView.swift
//  ExploreBobsBurgersApp
//
//  Created by Scriffles on 7/28/23.
//

import SwiftUI

struct CharactersHomeView: View {
    
    @EnvironmentObject private var vm: ViewModel
    
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
                }
                .padding(.leading)
                
                HomeViewLabel(label: CategoriesEnum.characters.label)
            }
            .padding(.bottom, 30)
            .background {
                Color.bBBlue.ignoresSafeArea()
                
            }
            
//            ScrollView {
//                ForEach(0..<20, id: \.self) {int in
//                    Rectangle()
//                        .foregroundColor(.blue).opacity(0.3)
//                        .aspectRatio(1, contentMode: .fill)
//                }
//            }
            
            Spacer()
        }
    }
}

struct CharactersHomeView_Previews: PreviewProvider {
    static var previews: some View {
        CharactersHomeView()
    }
}
