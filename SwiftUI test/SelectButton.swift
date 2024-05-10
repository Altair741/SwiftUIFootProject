//
//  Button.swift
//  ICT_footassessment
//
//  Created by 강민구 on 31/3/2024.
//

import SwiftUI

struct SelctButton: View {
    @Binding var toNavigate: Bool
    @Binding var isSelected: Bool
    let color: Color
    let text: String
    
    var body: some View {
        Button(action: {
            isSelected.toggle()
            if isSelected {
                toNavigate = true
            }

        }) {
            ZStack {
                Capsule()
                    .frame(width: 120, height: 50)
                    .foregroundColor(isSelected ? color : .gray)
                Text(text)
                    .foregroundColor(.white)
            }
        }
    }
}
