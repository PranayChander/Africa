//
//  VideoModel.swift
//  Africa
//
//  Created by pranay chander on 29/03/21.
//

import Foundation

struct Video: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String

    var thumbnail: String {
        "video-\(id)"
    }
}
