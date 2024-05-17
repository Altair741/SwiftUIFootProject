//
//  WithPictorial.swift
//  ICT_footassessment
//
//  Created by 강민구 on 3/4/2024.
//


import SwiftUI
import AVKit

struct WithPictorial: View {
    let videoName: String

    var body: some View {
        VideoPlayer(player: AVPlayer(url: Bundle.main.url(forResource: videoName, withExtension: "mp4")!))
            .frame(width: 350, height: 190)
            .cornerRadius(12)
            .padding(.horizontal, 24)
    }
}

