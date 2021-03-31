//
//  VideoPlayerHelper.swift
//  Africa
//
//  Created by pranay chander on 29/03/21.
//

import Foundation
import AVKit

var videoPlayer: AVPlayer?

func playVideo(fileName: String, fileFormat: String) -> AVPlayer {
    guard let video = Bundle.main.url(forResource: fileName, withExtension: fileFormat) else {
        return AVPlayer(url: Bundle.main.url(forResource: "cheetah", withExtension: ".mp4")!)
    }
    let player = AVPlayer(url: video)
        player.play()
    return player
}
