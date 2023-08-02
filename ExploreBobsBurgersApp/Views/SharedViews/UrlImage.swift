//
//  UrlImage.swift
//  ExploreBobsBurgersApp
//
//  Created by Scriffles on 7/31/23.
//

import SwiftUI

struct UrlImage: View {
    
    @ObservedObject var imageLoader = ImageLoader()
    let urlString: String?
    
    var body: some View {
        ZStack {
            if let image = imageLoader.uiImage {
                Image(uiImage: image)
                    .resizable()
            }
            else {
                CharacterPlaceholderView()
            }
        }
        .onAppear {
            Task {
                do {
                    try await imageLoader.fetchImage(urlString: urlString)
                }
                catch {
                    print(error)
                }
            }
        }
    }
}


//struct UrlImage_Previews: PreviewProvider {
//    static var previews: some View {
//        UrlImage()
//    }
//}
