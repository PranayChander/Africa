//
//  VideoListView.swift
//  Africa
//
//  Created by pranay chander on 20/03/21.
//

import SwiftUI

struct VideoListView: View {
    @State var videos: [Video] = Bundle.main.decode("videos.json")
    let hapticImpact =
        UIImpactFeedbackGenerator(style: .medium)

    var body: some View {
        NavigationView {
            List(videos) { video in
                NavigationLink(destination: VideoPlayerView(videoSelected: video.id, videoTitle: video.name)) {
                    VideoListItemView(video: video)
                        .padding(.vertical, 8)
                }
            }
            .listStyle(InsetGroupedListStyle())
            .navigationBarTitle("Videos", displayMode: .inline)
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        videos.shuffle()
                        hapticImpact.impactOccurred()
                    }, label: {
                        Image(systemName: "arrow.2.squarepath")
                    })
                }
            })
        }

    }
}

struct VideoListView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
    }
}
