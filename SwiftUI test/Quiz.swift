//
//  ContentView.swift
//  SwiftUI test
//
//  Created by Ethan Li on 5/5/2024.
//

import SwiftUI

struct Quiz: View {
    struct QuestionData{
        //set Ask question
        let question : String
        let imageName : String?
        let buttonLable : [String]
    }
    @State private var currentSection = 0 // Start with section 0 (Ask)
    @State private var currentQuestion = 0
    @State private var showAlert = false
    @State private var selectedButtonIndex: Int? = nil
    
    @State private var answers: [[String]]
    
    init() {
        _answers = State(initialValue: Array(repeating: [], count: sections.count))
    }
    private func calculateProgress() -> Double {
        let questionsInSection = questions.count
        let totalQuestions = sections.reduce(0) { (accumulatedQuestions, sectionName) in // Adjust parameter names
            accumulatedQuestions + questionsInSection
        }
        
        return Double(currentQuestion + (currentSection * questionsInSection)) / Double(totalQuestions)
    }
    
    
    
    // Stores user answers
    
    let sections = ["Ask", "Touch", "Observation"]
    let questions: [QuestionData] = [
        
        QuestionData(question: "What kind of shoes is the patient wearing today?", imageName: "imageName1", buttonLable: ["Closed Shoe", "Open shoes"]),
        QuestionData(question: "Does the patient have pain in their legs when walking?", imageName: nil, buttonLable: ["Yes", "No", "sometime"]),
        QuestionData(question: "Does the patient have pain in their legs when lying down?", imageName: nil, buttonLable: ["Yes", "No", "Maybe"]),
        QuestionData(question: "Does the patient have pain get pings and needles?", imageName: nil, buttonLable: ["Yes", "No", "Maybe"]),
        QuestionData(question: "Does the patient feel sharp pain?", imageName: nil, buttonLable: ["Yes", "No", "Maybe"]),
        QuestionData(question: "Does the patient feet get numb?", imageName: nil, buttonLable: ["Yes", "No", "Maybe"]),
        QuestionData(question: "Does the patient toes get numb?", imageName: nil, buttonLable: ["Yes", "No", "Maybe"]),
        QuestionData(question: "Does the patient make regular podiatrist visit?", imageName: nil, buttonLable: ["Yes", "No"]),
        QuestionData(question: "Does the patient smoke?", imageName: nil, buttonLable: ["Yes", "No", "Maybe"]),
        QuestionData(question: "What is the condition of the skin?", imageName: nil, buttonLable: ["Dry","Normal","Sweaty","Shiney"]),
        QuestionData(question: "what is the temperature of the foot?", imageName: nil, buttonLable:["Cold","Warm","Hot"]),
        QuestionData(question: "Is there any swelling aroud the feet and ankle?", imageName: nil, buttonLable: ["Yes", "No"]),
        QuestionData(question: "Has patient shaved?", imageName: nil, buttonLable: ["Yes", "No"]),
        
        
    ]
    
    struct ProgressBar: View {
        @Binding var progress: Double
        
        var body: some View {
            ProgressView(value: progress)
                .progressViewStyle(.linear)
                .tint(.green)
        }
    }
    
    @State private var progress = 0.0
    var body: some View {
        NavigationView{
            VStack {
                if sections[currentSection] == "Ask" {
                    Text(sections[currentSection])
                        .font(.largeTitle)
                    ProgressBar(progress: $progress)
                    
                    // Question & Image area
                    VStack(spacing: 20) {
                        Text(questions[currentQuestion].question) // Display the question
                            .font(.title2)
                        
                        if let imageName = questions[currentQuestion].imageName {
                            Image(imageName) // Load the image if it exists
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                        }
                    }
                    
                    // Dynamic Buttons based on question data
                    HStack {
                        ForEach(questions[currentQuestion].buttonLable, id: \.self) { buttonLabel in
                            Button(buttonLabel) {
                                // Record the answer
                                answers[currentSection].append(buttonLabel)
                                selectedButtonIndex = questions[currentQuestion].buttonLable.firstIndex(of: buttonLabel)
                            }
                            .background(selectedButtonIndex == questions[currentQuestion].buttonLable.firstIndex(of: buttonLabel) ? Color.green: Color.white) // Highlight if selected
                        }
                        
                        
                        
                        Button("Next") {
                            if currentQuestion < questions.count - 1  {
                                currentQuestion += 1
                                progress = calculateProgress()
                                
                            } else {
                                // User is on the last question in 'Ask' section
                                showAlert = true
                            }
                        }
                        
                        //.opacity(currentQuestion == questions.count - 1 ? 0 : 1) // Hide at the end
                        Spacer(minLength: 20)
                        
                        Button("Back") {
                            if currentQuestion > 0 {
                                currentQuestion -= 1
                                progress = calculateProgress()
                            }
                        }
                        .opacity(currentQuestion == 0 ? 0 : 1) // Hide if on the first question
                        .onChange(of: currentQuestion) { _ in
                            selectedButtonIndex = nil
                        }
                        .alert("Move to Touch section?", isPresented: $showAlert) {
                            Button("Yes") {
                                currentSection = 1 // Update to Touch section index as needed
                                currentQuestion = 0 // Reset question index
                                
                            }
                            Button("Cancel", role: .cancel) {}
                            
                        }
                    }
                    
                }
                //Touching Section
                VStack {
                    if sections[currentSection] == "Touch" {
                        Button("this is touch test"){
                            
                        }
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
            
        }
        
        
        
        
        
    }
}
    
    /*
    
    
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
                    Button("Next"){
                        //nextQuestion()
                    }
                    Button("Back"){
                        //backQuestion()
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
*/
