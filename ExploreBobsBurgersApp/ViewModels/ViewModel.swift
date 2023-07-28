//
//  ViewModel.swift
//  ExploreBobsBurgersApp
//
//  Created by Scriffles on 7/28/23.
//

import Foundation

class ViewModel: ObservableObject {
    
    @Published var currentViewState: ViewStateEnum = .home
    
    func changeViews(category: CategoriesEnum) {
        switch category {
        case .characters:
            currentViewState = .characters
        case .episodes:
            currentViewState = .episodes
        case .favorites:
            currentViewState = .favorites
        }
    }
    
}
