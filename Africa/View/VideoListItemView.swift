//
//  VideoListItem.swift
//  Africa
//
//  Created by pranay chander on 29/03/21.
//

import SwiftUI

struct VideoListItemView: View {
    let video: Video
    var body: some View {
        HStack(spacing: 10) {
            ZStack {
                Image(video.thumbnail)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 80)
                    .cornerRadius(9.0)
                Image(systemName: "play.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 32)
                    .shadow(radius: 4)
            }

            VStack(alignment: .leading, spacing: 10, content: {
                Text(video.name)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(.accentColor)
                Text(video.headline)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
            })
        }
    }
}

struct VideoListItem_Previews: PreviewProvider {
    static var previews: some View {
        let videos: [Video] = Bundle.main.decode("videos.json")
        VideoListItemView(video: videos[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
