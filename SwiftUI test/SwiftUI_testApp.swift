//
//  SwiftUI_testApp.swift
//  SwiftUI test
//
//  Created by Ethan Li on 5/5/2024.
//

import SwiftUI

@main
struct SwiftUI_testApp: App {
    @StateObject var answer = UserAnswer()

    
    var body: some Scene {
        WindowGroup {
                LaunchScreen()
                    .environmentObject(answer)
            
        }
    }
}
