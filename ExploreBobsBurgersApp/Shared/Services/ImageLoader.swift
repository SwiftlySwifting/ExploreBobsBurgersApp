//
//  ImageLoader.swift
//  ExploreBobsBurgersApp
//
//  Created by Scriffles on 7/31/23.
//

import Foundation
import SwiftUI


@MainActor
class ImageLoader: ObservableObject {
    
    @Published var uiImage: UIImage?
    private let cache = ImageCache.shared
    
    //TODO: load images to disk and memory
    
    func fetchImage(urlString: String?) async throws {
                
        guard let urlString = urlString else {
            throw NetworkError.badUrl
        }
        
        guard let url = URL(string: urlString) else {
            throw NetworkError.badRequest
        }
//        print(url.lastPathComponent)

        let request = URLRequest(url: url)
        
        //check the cache
        //capital "S" becase cache is static
                
        if let cachedImage = cache.object(forKey: url.absoluteString as NSString) {
            uiImage = cachedImage
        }
        else {
            let (data, response) = try await URLSession.shared.data(for: request)
            guard let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode == 200 else {
                throw NetworkError.badRequest
            }
            
            guard let image = UIImage(data: data) else {
                throw NetworkError.unsupportedImage
            }
            //store in cache
            cache.setObject(image, forKey: url.absoluteString as NSString)
            
            uiImage = image
        }
    }
}

