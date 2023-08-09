//
//  EpisodeCell.swift
//  ExploreBobsBurgersApp
//
//  Created by Scriffles on 8/9/23.
//

import SwiftUI

struct EpisodeCell: View {
    
    var episode: EpisodeModel
    
    var body: some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .foregroundColor(.white)
                .frame(height: 120)
                .shadow(color: .black.opacity(0.3),
                        radius: 4,
                        x: 2, y: 2)
            
            HStack(alignment: .top) {
                
                ZStack {
                    Rectangle()
                        .frame(width: 60, height:90)
                        .foregroundColor(.yellow)
                        
                    Text("\(episode.episode)")
                        .font(.appTitle)
                        .foregroundColor(.bBRed)
                        .shadow(color: .black,
                                radius: 1,
                                x: 1, y: 1)
                }
                
                VStack(alignment: .leading) {
                    Text(episode.name)
                    Spacer()
                    Text("Viewers: " + episode.totalViewers)
                    if episode.airDate != nil {
                        Text("Air Date: " + episode.airDate!)
                    }
                }
                .font(.appCallout)
            }
            .padding()
        }
    }
}

//struct EpisodeCell_Previews: PreviewProvider {
//    static var previews: some View {
//        EpisodeCell()
//    }
//}



