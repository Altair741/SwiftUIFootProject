//
//  SwiftUI_testApp.swift
//  SwiftUI test
//
//  Created by Ethan Li on 5/5/2024.
//

import SwiftUI

@main
struct SwiftUI_testApp: App {
    @StateObject var userAnswer = UserAnswer()
    @StateObject var locationManager = LocationManager2()
    
    var body: some Scene {
        WindowGroup {
            LaunchScreen()
                .environmentObject(userAnswer)
                .environmentObject(locationManager)
        }
    }
}
