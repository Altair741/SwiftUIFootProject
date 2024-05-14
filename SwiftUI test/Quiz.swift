//
//  ContentView.swift
//  SwiftUI test
//
//  Created by Ethan Li on 5/5/2024.
//

import SwiftUI
/*
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
     
     init(answers: [[String]] = []) { // Add new initializer
     _answers = State(initialValue: answers) // Use passed or empty array
     }
     @State private var touchTest = IpswichTouchTest()
     
     
     // Define IpswichTouchTest here
     struct IpswichTouchTest {
     var isRightFootSelected = true
     var currentToe = 0
     var userResponses: [[Bool]] = [[], []]
     }
     
     private func calculateProgress() -> Double {
     let questionsInSection = questions.count / sections.count  // Assuming equal questions per section
     let totalQuestions = sections.count * questionsInSection
     
     let questionsAnswered = answers.reduce(0, { $0 + $1.count })
     
     return Double(questionsAnswered) / Double(totalQuestions)
     }
     
     
     // Stores user answers
     
     let sections = ["Ask", "Touch", "Observation"]
     let questions: [QuestionData] = [
     
     QuestionData(question: "What kind of shoes is the patient wearing today?", imageName: "Shoes.jpg", buttonLable: ["Closed Shoe", "Open shoes"]),
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
     QuestionData(question: "Is there any swelling aroud the feet and ankle?", imageName: nil, buttonLable: ["Yes", "No"])
     
     
     
     ]
     
     struct ProgressBar: View {
     @Binding var progress: Double
     
     var body: some View {
     ProgressView(value: progress)
     .progressViewStyle(.linear)
     .tint(.green)
     }
     }
     
     
     struct TouchTestView: View {
     @Binding var touchTest: IpswichTouchTest
     @Environment(\.dismiss) var dismiss // For sheet dismissal
     @State private var userPrompt = "Instruct the patient to close their eyes."
     @State private var showScore = false
     @State private var scoreMessage = " "
     
     @Binding var showAlert:Bool
     private func updateUserPrompt() {
     let currentToeData = toesOrder[touchTest.currentToe]
     userPrompt = "Lightly touch the \(currentToeData.toe) of the \(currentToeData.side) foot and ask the patient to say 'Yes' if they feel it."
     }
     private func moveToNextToe() {
     if touchTest.currentToe < toesOrder.count - 1 {
     touchTest.currentToe += 1
     updateUserPrompt()
     } else {
     // Handle end of test (calculate score, etc.)
     }
     }
     }
     //Calculate and Display Score
     private func calculateAndDisplayScore() {
     let totalScore = GoodScore - BadScore // Corrected score calculation
     
     scoreMessage = "Ipswich Touch Test Score: \(totalScore)/6\n"
     if totalScore == 6 {
     scoreMessage += "Good score"
     } else if totalScore < 4 {
     scoreMessage += "Indicates neuropathy"
     } else {
     scoreMessage += "Poor score"
     }
     showScore = true // Show the score
     }
     
     
     
     let toesOrder = [
     (side: "Right", toe: "Big Toe", imageName: "rightBigToe.avif"),
     (side: "Right", toe: "Little Toe", imageName: "rightLittleToe"),
     (side: "Left", toe: "Big Toe", imageName: "leftBigToe"),
     (side: "Left", toe: "Little Toe", imageName: "leftLittleToe"),
     (side: "Right", toe: "Middle Toe", imageName: "rightMiddleToe"),
     (side: "Left", toe: "Middle Toe", imageName: "leftMiddleToe")
     ]
     
     var body: some View {
     VStack {
     
     Text("IPSwich Touch Test")
     .multilineTextAlignment(.center)
     .padding()
     
     Image(toesOrder[touchTest.currentToe].imageName) // Display image for current toe
     .resizable()
     .scaledToFit()
     .frame(width: 150, height: 150)
     
     Text(userPrompt) // Display instructions/prompts
     .multilineTextAlignment(.center)
     .padding()
     
     // Response Buttons
     HStack {
     Button("Yes") {
     GoodScore += 1
     //touchTest.userResponses[touchTest.isRightFootSelected ? 0 : 1].append("Yes")
     moveToNextToe()
     }
     
     Button("No") {
     BadScore += 1
     //touchTest.userResponses[touchTest.isRightFootSelected ? 0 : 1].append("No")
     moveToNextToe()
     }
     }
     .padding(.bottom)
     // Back and Next Buttons
     HStack {
     Button("Back Toe") {
     if touchTest.currentToe > 0 {
     touchTest.currentToe -= 1
     updateUserPrompt()
     }
     }
     .disabled(touchTest.currentToe == 0)
     .multilineTextAlignment(.center)
     
     Spacer()
     
     Button(touchTest.currentToe < toesOrder.count - 1 ? "Next Toe" : "Finish Test") {
     if touchTest.currentToe < toesOrder.count - 1 {
     touchTest.currentToe += 1
     updateUserPrompt()
     } else {
     // Check if all toes have a response before calculating the score
     if touchTest.userResponses.allSatisfy({ !$0.isEmpty }) {
     calculateAndDisplayScore()
     } else {
     // Alert the user if there are missing responses
     showAlert = true
     }
     }
     }
     .disabled(touchTest.userResponses[touchTest.currentToe].isEmpty)
     // Alert for missing responses
     .alert("Please provide answers for all toes.", isPresented: $showAlert) {
     Button("OK", role: .cancel) { }
     }
     
     
     }
     }
     }
     }
     
     
     
     
     @State private var progress = 0.0
     var body: some View {
     NavigationView{
     VStack {
     if sections[currentSection] == "Ask" {//Ask section
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
     }
     HStack{
     
     
     
     
     Button("Next") {
     if selectedButtonIndex != nil { // Check if an answer is selected
     if currentQuestion < questions.count - 1 {
     currentQuestion += 1
     progress = calculateProgress()
     selectedButtonIndex = nil // Reset for the next question
     } else {
     showAlert = true
     }
     } else {
     // User didn't select an answer
     showAlert = true
     }
     }
     
     
     .alert("Please provide an answer", isPresented: $showAlert) {
     Button("OK", role: .cancel) {}
     }
     
     
     //.opacity(currentQuestion == questions.count - 1 ? 0 : 1) // Hide at the end
     //Spacer(minLength: 20)
     
     Button("Back") {
     if currentQuestion > 0 {
     currentQuestion -= 1
     progress = calculateProgress()
     }
     else if currentQuestion == 0{
     showAlert = true
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
     
     //---------------------------------------------------------------------------------------------------------------------//
     //Touching Section
     VStack {
     
               if sections[currentSection] == "Touch" {
                 TouchTestView(touchTest: $touchTest, showAlert: $showAlert) // Pass showAlert
               }
     
     
     }
     
     .alert("Please provide an answer", isPresented: $showAlert) {
     
     }
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
     */

