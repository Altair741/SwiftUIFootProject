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
                    Text("Foot Diagons")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding()

                    NavigationLink(destination: Quiz()) {
                        Text("Start")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }

                    NavigationLink(destination: SignInView()) {
                        Text("FirstSign In page")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
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
