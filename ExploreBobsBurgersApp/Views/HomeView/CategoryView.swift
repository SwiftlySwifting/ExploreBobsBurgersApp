//
//  CategoryView.swift
//  ExploreBobsBurgersApp
//
//  Created by Scriffles on 7/27/23.
//

import SwiftUI

struct CategoryView: View {
    
    var category: CategoriesEnum
    
    var body: some View {
        Image(category.imageStr)
            .resizable()
            .scaledToFit()
            .padding()
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView(category: .episodes)
    }
}
