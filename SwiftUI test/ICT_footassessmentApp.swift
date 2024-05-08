//
//  ICT_footassessmentApp.swift
//  ICT_footassessment
//
//  Created by 강민구 on 31/3/2024.
//

import SwiftUI

@main
struct ICT_footassessmentApp: App {
    
    @StateObject var userAnswer = UserAnswer()
    @StateObject var locationManager = LocationManager2()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(userAnswer)
                .environmentObject(locationManager)
        }
    }
}
