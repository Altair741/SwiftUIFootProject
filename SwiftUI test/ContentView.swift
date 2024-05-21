//
//  ContentView.swift
//  SwiftUI test
//
//  Created by Ethan Li on 5/5/2024.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationView { // Use NavigationView for navigation structure
            VStack(alignment: .center) {
                Text("Foot Test")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                //Start ASk section and IPWich test
                NavigationLink(destination: Quizinerfaces()) {
                    Text("Start")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                //Start uer log in page
                NavigationLink(destination: SignInView()) {
                    Text("FirstSign In page")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                //Mingu : i'm gonna use this link to test my part of code!
                
                .navigationTitle("") // Hide default title
                .navigationBarHidden(true) // Hide navigation bar
            }
        }
    }
    
    struct ManualPage: View {
        var body: some View {
            Text("Manual Content Goes Here")
                .font(.title)
        }
        
    }
}
