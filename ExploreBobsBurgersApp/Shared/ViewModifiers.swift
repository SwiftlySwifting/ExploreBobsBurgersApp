//
//  ViewModifiers.swift
//  ExploreBobsBurgersApp
//
//  Created by Scriffles on 7/28/23.
//

import Foundation
import SwiftUI

extension View {
    func previewData() -> some View {
        modifier(PreviewData())
    }
}

struct PreviewData: ViewModifier {
    func body(content: Content) -> some View {
        content
            .environmentObject({ () -> ViewModel in
                let object = ViewModel()
                
                var models = [CharacterModel]()
                for int in 1..<7 {
                    models.append(CharacterModel(id: int,
                                                 name: "Char \(int)",
                                                 image: "char\(int)",
                                                 gender: "Char \(int) Gender",
                                                 hairColor: "Char \(int) Hair Color",
                                                 occupation: "Char \(int) Occupation",
                                                 firstEpisode: "Char \(int) First Episode",
                                                 voicedBy: "Char \(int) Voiced By",
                                                 url: "Char \(int) URL",
                                                 wikiUrl: "Char \(int) Wiki URL",
                                                 relatives: []))
                }
                object.allCharacters = models
                return object
                
            }())
    }
}
