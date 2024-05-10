//
//  Test1.1.swift
//  ICT_footassessment
//
//  Created by 강민구 on 30/4/2024.
//

import SwiftUI

struct Test1_1: View {
    
    @State private var isSelected = false
    @State private var isSelected2 = false
    @State private var navigateToEnd = false
    @State private var medicalInfoScript = ""


    
    var body: some View {
        TabView {
            VStack {
                Text("If Question needs medical guide resource?")
                    .padding(.leading, 5)
                    .foregroundColor(Color.red) // color change
                
                Text("Can you feel a pulse in the dorsalis pedis?")
                Text("Move Back to 1st Question, when you click")
                    .foregroundColor(Color.gray)
                HStack {
                    Button("pitting") {
                        isSelected = true
                        isSelected2 = false
                        navigateToEnd = true
                    }
                    .buttonStyle(SelectedButtonStyle(isSelected: isSelected))
                    
                    Button("none pitting") {
                        isSelected2 = true
                        isSelected = false
                        navigateToEnd = true

                    }
                    .buttonStyle(SelectedButtonStyle(isSelected: isSelected2))
                }
                .padding(.leading, 10)
                
                NavigationLink(destination: EndPage(), isActive: $navigateToEnd) {
                    EmptyView()
                }

                ProgressBar(progess: 5)
            }
            .tabItem {
                Label("Test1_1", systemImage: "bolt")
            }
            
            // Second Tab
            NavigationView {
                ScrollView {
                    VStack {
                        Divider()
                        Text("Pictorial resources")
                            .font(.title3)
                            .fontWeight(.bold)
                            .padding(.trailing, 100)
                        WithPictorial(ID: "MUQynw8UnqA")
                    }
                }
            }
            .tabItem {
                Label("Pictorial", systemImage: "heart")
            }
        }
    }
}
