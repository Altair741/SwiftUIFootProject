//
//  QuizInterfaces.swift
//  FootTest
//
//  Created by Ethan Li on 14/5/2024.
//

import SwiftUI
let sections = ["Basic prompt", "examination",]//"Touch", "Result"
// Change it to set globally.
// 1. QuestionData Struct

struct QuestionData: Identifiable { // Make QuestionData Identifiable for use in List
    let id = UUID()
    let question: String
    let imageName: String?
    let buttonLabels: [String]
}

// 2. IpswichTouchTest Struct
struct IpswichTouchTest {
    var isRightFootSelected = true
    var currentToe = 0
    var userResponses: [[Bool]] = [[], []]
}

// 3. ProgressBar Struct
struct ProgressBar: View {
    @Binding var progress: Double
    
    var body: some View {
        ProgressView(value: progress)
            .progressViewStyle(.linear)
            .tint(.green)
    }
}

let questions: [QuestionData] = [
    QuestionData(question: "What kind of shoes is the patient wearing today?", imageName: "Shoes.jpg", buttonLabels: ["Closed Shoe", "Open shoes"]),
    QuestionData(question: "Does the patient have pain in their legs when walking?", imageName: nil, buttonLabels: ["Yes", "No", "sometime"]),
    QuestionData(question: "Does the patient have pain in their legs when lying down?", imageName: nil, buttonLabels: ["Yes", "No", "Maybe"]),
    QuestionData(question: "Does the patient have pain get pings and needles?", imageName: nil, buttonLabels: ["Yes", "No", "Maybe"]),
    QuestionData(question: "Does the patient feel sharp pain?", imageName: nil, buttonLabels: ["Yes", "No", "Maybe"]),
    QuestionData(question: "Does the patient feet get numb?", imageName: nil, buttonLabels: ["Yes", "No", "Maybe"]),
    QuestionData(question: "Does the patient toes get numb?", imageName: nil, buttonLabels: ["Yes", "No", "Maybe"]),
    QuestionData(question: "Does the patient make regular podiatrist visit?", imageName: nil, buttonLabels: ["Yes", "No"]),
    QuestionData(question: "Does the patient smoke?", imageName: nil, buttonLabels: ["Yes", "No", "Maybe"]),
    QuestionData(question: "What is the condition of the skin?", imageName: nil, buttonLabels: ["Dry","Normal","Sweaty","Shiney"]),
    QuestionData(question: "what is the temperature of the foot?", imageName: nil, buttonLabels:["Cold","Warm","Hot"]),
    QuestionData(question: "Is there any swelling aroud the feet and ankle?", imageName: nil, buttonLabels: ["Yes", "No"])
]
let toesOrder = [
    (side: "Right", toe: "Big Toe", imageName: "rightBigToe.avif"),
    (side: "Right", toe: "Little Toe", imageName: "rightLittleToe"),
    (side: "Left", toe: "Big Toe", imageName: "leftBigToe"),
    (side: "Left", toe: "Little Toe", imageName: "leftLittleToe"),
    (side: "Right", toe: "Middle Toe", imageName: "rightMiddleToe"),
    (side: "Left", toe: "Middle Toe", imageName: "leftMiddleToe")
]

// 4. Quiz Struct (Main View)
struct Quizinerfaces: View {
    @State private var currentSection = 0
    @State private var currentQuestion = 0
    @State private var showAlert = false
    @State private var selectedButtonIndex: Int? = nil
    @State private var answers: [[String]]
    @State private var touchTest = IpswichTouchTest()
    
    
    init(answers: [[String]] = []) {
        _answers = State(initialValue: answers)
    }
    
    private func calculateProgress() -> Double {
        let questionsInSection = questions.count / sections.count  // Assuming equal questions per section
        let totalQuestions = sections.count * questionsInSection
        let questionsAnswered = answers.reduce(0, { $0 + $1.count })
        return Double(questionsAnswered) / Double(totalQuestions)
        
    }
    
    @State private var progress = 0.0
    
    var body: some View {
        // Mingu default navigationBarBackButtonHidden to manage Navigation View after wards
        Spacer()
            .navigationBarBackButtonHidden(true)
        Spacer()
        
        
        NavigationView {
            ZStack {
                
                if sections[currentSection] == "Basic prompt" {
                    AskSectionView(questions: questions)
                }
                
                // Mingu : Add connection to Skin condition
                else if sections[currentSection] == "examination" {
                    Q1()
                }
                //                else if sections[currentSection] == "Touch" {
                //                    //TouchTestView(touchTest: $touchTest)
                //                    DP_test()
                //                }
                // Mingu : Add connection to EndPage
                //                else if sections[currentSection] == "Result" {
                //                    EndPage()
                //                        .navigationBarBackButtonHidden()
                //                }
                
            }
            // Mingu : edit toolbar items to switch each of sections.
            .toolbar {
                
                ToolbarItem(placement: .bottomBar) {
                    HStack {
                        ForEach(0..<sections.count) { index in
                            Button(action: { currentSection = index })
                            {
                                Text(sections[index])
                                    .foregroundColor(index == currentSection ? .red : .gray)
                                    .padding(.horizontal)
                            }
                        }
                    }
                }
            }
        }.alert("Please provide an answer", isPresented: $showAlert) { }
    }
}


struct AskSectionView: View{
    @State private var currentQuestionIndex = 0 // Track current question
    // Mingu : it has to be global scale variable to record this value.
    @State private var selectedAnswers: [String] = [] // Store selected answers
    // Mingu : Add global variable to store answers in selectedAnswers
    @EnvironmentObject var answer : UserAnswer
    // Mingu : var moveToSkinconditionCheck is to navigate skin condition assessment part
    @State private var moveToSkinconditionCheck = false
    @State private var isQuestionListExpanded = false
    @State private var showAlert = false
    let questions: [QuestionData]
    
    var body: some View {
        NavigationView {
            VStack {
                // Mingu: Test if selectedAnswers can capture the answer.
                //Text(selectedAnswers.indices.contains(1) ? selectedAnswers[1] : "")
                
                
                // Progress Bar
                ProgressView(value: Double(currentQuestionIndex + 1), total: Double(questions.count))
                    .padding()
                
                // Question Area
                Group {
                    if let imageName = questions[currentQuestionIndex].imageName {
                        Image(imageName)
                            .resizable()
                            .scaledToFit()
                    }
                    
                    Text(questions[currentQuestionIndex].question)
                        .font(.headline)
                        .padding()
                }
                
                // Answer Buttons
                ForEach(questions[currentQuestionIndex].buttonLabels, id: \.self) { label in
                    Button(action: {
                        selectedAnswers.append(label) // Store selected answer
                        nextQuestion() // Move to next question
                    }) {
                        Text(label)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                }
                
                // Navigation Buttons
                HStack {
                    Button("Back") {
                        previousQuestion()
                    }
                    .disabled(currentQuestionIndex == 0) // Disable if at the beginning
                    
                    Spacer() // Push buttons to sides
                    
                    Button("Next") {
                        nextQuestion()
                    }
                    .disabled(currentQuestionIndex == questions.count - 1 || selectedAnswers.count <= currentQuestionIndex) // Disable at the end or if no answer is selected
                    
                }
                .padding()
                
                DisclosureGroup("Jump to Question", isExpanded: $isQuestionListExpanded) {
                    List {
                        ForEach(0..<questions.count, id: \.self) { index in
                            Button(action: {
                                if index > currentQuestionIndex {
                                    showAlert = true // Show alert if trying to skip ahead
                                } else {
                                    currentQuestionIndex = index // Allow jumping back
                                }
                            }) {
                                Text("\(index + 1)")
                                    .foregroundColor(index == currentQuestionIndex ? Color.blue : Color.primary)
                            }
                        }
                    }
                    .frame(height: isQuestionListExpanded ? 200 : 0)
                    .clipped()
                }
                // Mingu : navigate to skin condition question
                NavigationLink(
                    destination: Q1(),
                    isActive: $moveToSkinconditionCheck,
                    label: {
                        EmptyView()
                    }
                )
            }
        }
        
    }
    
    func nextQuestion() {
        answer.assessmentRecord[currentQuestionIndex] = selectedAnswers[currentQuestionIndex]
        // Mingu : Test to see value in console.
        //           print(answer.assessmentRecord[currentQuestionIndex])
        
        if currentQuestionIndex < questions.count - 1 {
            currentQuestionIndex += 1
        }
        // Mingu modified, if it hit the last question..
        else{
            moveToSkinconditionCheck = true
            // Mingu: If it hit the last questions store all of the answers to global variable
        }
    }
    
    func previousQuestion() {
        if currentQuestionIndex > 0 {
            currentQuestionIndex -= 1
        }
    }
    // Mingu : method to capture the answer and store them to global scale variable
    func updateAnswer(_ answer: UserAnswer) {
        for e in selectedAnswers {
            answer.assessmentRecord.append(e)
        }
    }
}




struct TouchTestView: View{
    @Binding var touchTest: IpswichTouchTest
    @Environment(\.dismiss) var dismiss // For sheet dismissal
    @State private var userPrompt = "Instruct the patient to close their eyes."
    @State private var showScore = false
    @State private var scoreMessage = " "
    @State private var BadScore = 0
    @State private var GoodScore = 0
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
    
    var body: some View{
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
            HStack{
                Button("Back toe"){
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
                            //showAlert = true
                        }
                    }
                }
            }
        }
    }
}
