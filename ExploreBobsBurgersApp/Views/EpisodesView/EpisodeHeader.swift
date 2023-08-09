//
//  EpisodeHeader.swift
//  ExploreBobsBurgersApp
//
//  Created by Scriffles on 8/9/23.
//

import SwiftUI

struct EpisodeHeader: View {
    
    var season: SeasonModel
    @Binding var showEpisodes: Bool
    
    var body: some View {
        
        Button {
            withAnimation {
                showEpisodes.toggle()
            }
        } label: {
            ZStack {
                Rectangle()
                    .frame(height: 50)
                    .foregroundColor(.bBRed)
                Text("Season \(season.number)")
                    .font(.appTitle2)
                    .foregroundColor(.white)
            }
        }
        .buttonStyle(.plain)
    }
}

//struct EpisodeHeader_Previews: PreviewProvider {
//    static var previews: some View {
//        EpisodeHeader()
//    }
//}
