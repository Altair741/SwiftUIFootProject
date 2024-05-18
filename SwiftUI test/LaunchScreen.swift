//
//  LaunchScreen.swift
//  FootTest
//
//  Created by 강민구 on 18/5/2024.
//

import SwiftUI

struct LaunchScreen: View {
    @State private var isActive = false
    @State private var opacity = 0.0
    
    var body: some View {
        if isActive
        {
            ContentView()
        }
        else
        {
            VStack
            {
                Image("launch_screen")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .opacity(opacity)
            }
            .onAppear {
                withAnimation(.easeIn(duration: 2)) {
                    self.opacity = 1.0
                }
            }
            .onAppear()
            {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.5)
                {
                    self.isActive = true
                }
            }
        }

    }
}

#Preview {
    LaunchScreen()
}

