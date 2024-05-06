//
//  ContentView.swift
//  SwiftUI test
//
//  Created by Ethan Li on 5/5/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var currentSection = 0 // Start with section 0 (Ask)
    @State private var currentQuestion = 0
    @State private var progress = 0.0
    @State private var userAnswer = ""
    @State private var showAlert = false
    struct IpswichTouchTest {
        var isRightFootSelected = true // Start with right foot selected
        var currentToe = 0 // Track which toe is being tested
        var userResponses: [[Bool]] = [[], []] // Record user responses (right, left foot)
    }

    @State private var touchTest = IpswichTouchTest()
    
    
    let sections = ["Ask", "Touch", "Observation"]
    let questions = ["this is the question 1","this is the question2"]
    // Your array of question data (text, image, etc.)
    
    var body: some View {
        VStack {
            
            if sections[currentSection] == "Ask" {
                Text(sections[currentSection]).font(.largeTitle)
                // Question & Image area
                VStack(spacing: 20) {
                    Text(questions[currentQuestion]) // Display the question
                        .font(.title2)
                    
                    // Replace with an Image view if you have images
                    Image(systemName: "questionmark.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                }
                
                // Two normal buttons (Replace labels as needed)
                HStack {
                    Button("Button 1") {
                        // answers[currentSection].append("Button 1") // Record the answer
                    }
                    Button("Button 2") {
                        // answers[currentSection].append("Button 2") // Record the answer
                    }
                }
                
                // Two initially hidden buttons
                HStack {
                    Button("Hidden Button 1") {
                        // Action when revealed
                    }
                    .opacity(0) // Initially hidden
                    Button("Hidden Button 2") {
                        // Action when revealed
                    }
                    .opacity(0) // Initially hidden
                }
                VStack{
                    Button("Back"){
                        //backQuestion()
                    }
                    Button("Next"){
                        //nextQuestion()
                    }
                }
                
            }
            
  
            VStack {
                if sections[currentSection] == "Touch" {
                     TouchTestView(testState: $touchTest) // Pass test state via binding
                 }
             }
             .alert("Please provide an answer", isPresented: $showAlert) { }
            
            .toolbar { // Add the toolbar
                ToolbarItemGroup(placement: .bottomBar) { // Items at the bottom
                    Button(sections[max(0, currentSection - 1)]) { // Previous section
                        if currentSection > 0 {
                            currentSection -= 1
                        }
                    }
                    Button(sections[currentSection]) {
                        // No action if tapping the current section
                    }
                    .disabled(true) // Make the current section button non-interactive
                    Button(sections[min(sections.count - 1, currentSection + 1)]) { // Next
                        if currentSection < sections.count - 1 {
                            currentSection += 1
                        }
                    }
                }
            }
        }
        .alert("Please provide an answer", isPresented: $showAlert) { }
        
    }


    struct ProgressBar: View {
        @Binding var value: Double

        var body: some View {
            ProgressView(value: value)
                .progressViewStyle(.linear) // Make it a linear bar style
                .tint(.green)
        }
    }
    struct NextButton: View {
        var action: () -> Void // A closure to handle the button press

        var body: some View {
            Button("Next") {
                
             }
             .padding()
             .background(Color.blue)
             .foregroundColor(.white)
        }
    }
    struct BackButton: View {
        var action: () -> Void // A closure to handle the button press

        var body: some View {
            Button("back") {
                
             }
             .padding()
             .background(Color.blue)
             .foregroundColor(.white)
        }
    }

    struct TouchTestView: View {
    @Binding var testState: IpswichTouchTest
                
    var body: some View {
        VStack {
            Text(testState.isRightFootSelected ? "Right Foot" : "Left Foot")
                .font(.title)
                        
            Image(systemName: "foot.prints") // Optional image for reference
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
                        
            Text("Please ask the patient to close their eyes and say 'Yes' whenever they feel your touch.")
                .padding()
                        
                HStack {
                    VStack {
                        Text("Big Toe")
                        Button("Test") {
                        testState.userResponses[testState.isRightFootSelected ? 0 : 1].append(true)
                        testState.currentToe += 1
                                }
                        }
                    VStack {
                        Text("Middle Toe")
                        Button("Test") {
                        testState.userResponses[testState.isRightFootSelected ? 0 : 1].append(true)
                        testState.currentToe += 1
                                }
                            }
                    VStack {
                        Text("Little Toe")
                        Button("Test") {
                        testState.userResponses[testState.isRightFootSelected ? 0 : 1].append(true)
                        testState.currentToe += 1
                                }
                            }
                        }
                        
                    HStack {
                        Spacer()
                        Button(testState.isRightFootSelected ? "Next Foot" : "Finish Test") {
                                
                            }
                        }
                    }
                    
                }
            }
        }
