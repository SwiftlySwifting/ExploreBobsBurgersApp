//
//  UrlImage.swift
//  ExploreBobsBurgersApp
//
//  Created by Scriffles on 7/31/23.
//

import SwiftUI

struct UrlImageStoreNextDoor: View {
    
    @ObservedObject var imageLoader = ImageLoader()
    let urlString: String?
    
    var body: some View {
        ZStack {
            if let image = imageLoader.uiImage {
                Image(uiImage: image)
                    .resizable()
            }
            else {
                StoreNextDoorPlaceholderView()
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
    }
}

