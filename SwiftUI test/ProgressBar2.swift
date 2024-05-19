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
        ProgressView("\(progess) out of 12", value: progess, total: 20 )
            .padding()
    }
}
