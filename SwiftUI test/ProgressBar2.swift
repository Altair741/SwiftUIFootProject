//
//  ProgressBar.swift
//  ICT_footassessment
//
//  Created by 강민구 on 3/4/2024.
//



import SwiftUI

struct ProgressBar2: View {
    @State var progess: Double = 0
    
    var body: some View {
        // ProgressView : "string", value : Float, total : total count
        ProgressView("\(Int(progess)) out of 17 total questions", value: progess, total: 15 ) // do one of touch test only
            .padding()
    }
}


struct ProgressBar3: View
{
    @State var progress : Double
    var body: some View
    {
        ProgressView("Do...", value: progress, total: 100)
    }
}


