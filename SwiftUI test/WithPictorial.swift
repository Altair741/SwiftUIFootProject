//
//  WithPictorial.swift
//  ICT_footassessment
//
//  Created by 강민구 on 3/4/2024.
//

import SwiftUI
import WebKit

struct WithPictorial: View {
    let ID: String
    
    var body: some View {
        
        Video(videoID: ID)
            .frame(width:350, height: 190)
            .cornerRadius(12)
            .padding(.horizontal, 24)
    }
}

struct Video: UIViewRepresentable{
    let videoID : String
    
    func makeUIView(context: Context) -> some WKWebView {
            return WKWebView()
        
    }
    func updateUIView(_ uiView: UIViewType, context: Context) {
        guard let YouTubeURL = URL(string:
                                    "https://www.youtube.com/watch?v=\(videoID)")
        else
        {return}
        uiView.scrollView.isScrollEnabled = false
        uiView.load(URLRequest(url: YouTubeURL))
    }
    
}
