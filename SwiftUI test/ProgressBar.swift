//
//  ProgressBar.swift
//  ICT_footassessment
//
//  Created by 강민구 on 3/4/2024.
//

import SwiftUI

struct ProgressBar: View {
    
    @State var progess: Double = 0
    
    var body: some View {
        ProgressView("Progress...", value: progess, total: 12 )
            .padding()
    }
}
#Preview {
    ProgressBar()
}

