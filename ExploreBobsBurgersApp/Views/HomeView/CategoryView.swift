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
        ZStack(alignment: .bottom) {
            Image(category.imageStr)
                .resizable()
                .scaledToFit()
                .shadow(color: .gray, radius: 3, x: 1, y: 1)

            HomeViewLabel(label: category.label)
                .offset(y: 15)
        }
        .padding()
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView(category: .episodes)
    }
}
