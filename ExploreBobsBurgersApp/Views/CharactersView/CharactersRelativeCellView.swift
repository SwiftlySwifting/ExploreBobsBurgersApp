//
//  CharactersRelativeCellView.swift
//  ExploreBobsBurgersApp
//
//  Created by Scriffles on 8/1/23.
//

import SwiftUI

struct CharactersRelativeCellView: View {
    
    var relative: RelativeModel
    
    var body: some View {
        
        ZStack {
            Rectangle()
                .foregroundColor(.bBBlue)
                .frame(height: 125)
                .shadow(color: .shadowColor, radius: 3, x: 1, y: 1)
            HStack(alignment: .top) {
                Image("char1")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100, alignment: .top)
                    .clipped()
                
                VStack(alignment: .leading, spacing:5) {
                    
                    VStack(alignment: .leading, spacing:0) {
                        Text("Name:")
                            .font(.appFootnote)
                        Text(relative.name)
                            .font(.appCallout)
                    }
                    
                    VStack(alignment: .leading, spacing:0) {
                        if relative.relationship != nil {
                            Text("Relationship:")
                                .font(.appFootnote)
                            Text(relative.relationship!)
                                .font(.appCallout)
                        }
                    }
                }
                .foregroundColor(.white)
                
                Spacer()
            }
            .padding(.all, 10)
        }
        .padding(.horizontal)
    }
}

struct CharactersRelativeCellView_Previews: PreviewProvider {
    static var previews: some View {
        CharactersRelativeCellView(relative: Constants.previewRelativesModelA)
    }
}