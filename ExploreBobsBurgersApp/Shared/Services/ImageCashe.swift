//
//  ImageCashe.swift
//  ExploreBobsBurgersApp
//
//  Created by Scriffles on 8/2/23.
//

import Foundation
import SwiftUI

class ImageCache {

    private init() {}

    static let shared = NSCache<NSString, UIImage>()
}
