//
//  Navigation.swift
//  FootTest
//
//  Created by Ethan Li on 3/6/2024.
//

import Foundation
import SwiftUI

struct Navigation: View {
    @State private var currentSection = 0
    @State private var currentQuestion = 0
    @State private var showAlert = false
    @State private var selectedButtonIndex: Int? = nil
    @State private var answers: [[String]]
    @State private var touchTest = IpswichTouchTest()
    
    @EnvironmentObject var answer : UserAnswer
    
    @State private var assessmentTaskDone = false
    @State private var isQuestionListExpanded = false
    @State private var currentViewOrder = 0
    @State private var isAnsweredDP = false
    @State private var isAnsweredPT = false
    @State private var isAnsweredMono = false
    @State private var isAnsweredSwitch = false
    
    // ... your taskView and taskList arrays remain the same ...
    
    init(answers: [[String]] = []) {
        _answers = State(initialValue: answers)
    }
    let taskView: [AnyView] = [
        AnyView(Q1()),
        AnyView(Q2()),
        AnyView(Q3()),
        AnyView(Q4()),
        AnyView(Q5()),
        AnyView(Q6()),
        AnyView(Q7()),
        AnyView(Q8()),
        AnyView(Q9()),
        AnyView(Q10()),
        AnyView(Q11()),
        AnyView(Q12()),
        AnyView(DP_test()),
        AnyView(PT_test()),
        AnyView(MyModal()),
        AnyView(Monofilament_test()),
        AnyView(IPSWICH_test()),
        AnyView(RiskCalculator()),
        AnyView(SignInView())
    ]
    
    let taskList: [QuestionItem] = [
        QuestionItem(task: "Callus", view: AnyView(Q1())),
        QuestionItem(task: "Corns", view: AnyView(Q2())),
        QuestionItem(task: "Tinea", view: AnyView(Q3())),
        QuestionItem(task: "Ulcer", view: AnyView(Q4())),
        QuestionItem(task: "Thickened toenails", view: AnyView(Q5())),
        QuestionItem(task: "Ingrown toenails", view: AnyView(Q6())),
        QuestionItem(task: "Bunions", view: AnyView(Q7())),
        QuestionItem(task: "Clawed toes", view: AnyView(Q8())),
        QuestionItem(task: "Flat feet", view: AnyView(Q9())),
        QuestionItem(task: "High arched feet", view: AnyView(Q10())),
        QuestionItem(task: "Charcot foot", view: AnyView(Q11())),
        QuestionItem(task: "Amputation", view: AnyView(Q12())),
        QuestionItem(task: "DP test", view: AnyView(DP_test())),
        QuestionItem(task: "PT test", view: AnyView(PT_test())),
        QuestionItem(task: "MyModal", view: AnyView(MyModal())),
        QuestionItem(task: "Monofilament test", view: AnyView(Monofilament_test())),
        QuestionItem(task: "IPSWICH touch test", view: AnyView(IPSWICH_test())),
        QuestionItem(task: "Risk", view: AnyView(RiskCalculator())),
        QuestionItem(task: "SignInView", view: AnyView(SignInView()))
    ]
    
    private func calculateProgress() -> Double {
        let questionsInSection = questions.count / sections.count
        let totalQuestions = sections.count * questionsInSection
        let questionsAnswered = answers.reduce(0, { $0 + $1.count })
        return Double(questionsAnswered) / Double(totalQuestions)
    }
    
    @State private var progress = 0.0
    
    var body: some View {
        NavigationView {
            ZStack {
                if sections[currentSection] == "Section 1 : Ask" {
                    AskSectionView(questions: questions)
                } else { // Combine other sections into the main view
                    VStack {
                        taskView[currentViewOrder] // Display the current task view
                        DisclosureGroup("Jump to Question", isExpanded: $isQuestionListExpanded) {
                            List(taskList) { question in
                                Button(action: {
                                    if let index = taskList.firstIndex(where: { $0.id == question.id }) {
                                        currentViewOrder = index
                                        isQuestionListExpanded = false
                                    }
                                }) {
                                    Text(question.task)
                                }
                            }
                            .frame(height: isQuestionListExpanded ? 200 : 0)
                            .clipped()
                        }
                        .padding()
                        HStack {
                            Button(action: {
                                withAnimation {
                                    
                                    currentViewOrder -= 1
                                    if currentViewOrder < 0 {
                                        currentViewOrder = taskView.count - 1
                                    }
                                    
                                    
                                }
                            }) {
                                Text("Back")
                                    .padding()
                            }
                            Spacer()
                            
                            
                            Button(action: {
                                withAnimation {
                                    
                                    
                                    
                                    if taskList[currentViewOrder].task == "DP test" && !isAnsweredDP{
                                        checkQuestionCompletion_DP_test()
                                    }
                                    else if taskList[currentViewOrder].task == "PT test" && !isAnsweredPT{
                                        checkQuestionCompletion_PT_test()
                                        
                                    }
                                    else if taskList[currentViewOrder].task == "Monofilament test" {
                                        checkQuestionCompletion_MonoTest()
                                        if(isAnsweredMono)
                                        {
                                            currentViewOrder += 2
                                            
                                        }
                                        
                                    }
                                    
                                    else if taskList[currentViewOrder].task == "IPSWICH touch test" && !isAnsweredSwitch{
                                        checkQuestionCompletion_SWTCH()
                                    }
                                    
                                    else if taskList[currentViewOrder].task == "MyModal"
                                    {
                                        if(checkMedicalTool())
                                        {
                                            currentViewOrder += 1
                                            
                                            if currentViewOrder >= taskView.count {
                                                currentViewOrder = 0
                                            }
                                        }
                                        else{
                                            currentViewOrder += 2
                                            
                                            if currentViewOrder >= taskView.count {
                                                currentViewOrder = 0
                                            }
                                        }
                                    }
                                    else {
                                        currentViewOrder += 1
                                        
                                        if currentViewOrder >= taskView.count {
                                            currentViewOrder = 0
                                        }
                                    }
                                }
                            }) {
                                Text("Next")
                                    .padding()
                                    .toolbar {
                                        ToolbarItem(placement: .bottomBar) {
                                            HStack {
                                                ForEach(0..<sections.count) { index in
                                                    Button(action: { currentSection = index }) {
                                                        Text(sections[index])
                                                            .foregroundColor(index == currentSection ? .red : .gray)
                                                            .padding(.horizontal)
                                                    }
                                                }
                                            }
                                        }
                                    }
                            }
                            
                        }
                        .padding()
                        
                    }

                }
            }
       

            .alert("Please provide an answer", isPresented: $showAlert) { }
            .navigationBarTitle("Examination", displayMode: .inline)
        }
    }
    
    func allTaskDone()
    {
        if (answer.checkCompletion())
        {
            assessmentTaskDone = true
        }
    }
    
    func checkMedicalTool() -> Bool
    {
        if answer.haveMedicalTool == "yes" {
            return true
        }
        else {
            return false
        }
    }
    func checkQuestionCompletion_DP_test() {
        if answer.answerRecord[12] == "Not Answered" || answer.answerRecord[13] == "Not Answered" {
            showAlert = true
            isAnsweredDP = false
        } else {
            isAnsweredDP = true
        }
    }
    func checkQuestionCompletion_PT_test() {
        if answer.answerRecord[14] == "Not Answered" || answer.answerRecord[15] == "Not Answered" {
            DispatchQueue.main.async {
                showAlert = true
                isAnsweredPT = false
            }
        } else {
            isAnsweredPT = true
        }
    }
    
    func checkQuestionCompletion_MonoTest() {
        if answer.answerRecord[16] == "Not Answered"{
            DispatchQueue.main.async {
                showAlert = true
                isAnsweredMono = false
            }
        } else {
            isAnsweredMono = true
        }
    }
    
    func checkQuestionCompletion_SWTCH() {
        if answer.answerRecord[17] == "Not Answered"{
            DispatchQueue.main.async {
                showAlert = true
                isAnsweredSwitch = false
            }
        } else {
            isAnsweredSwitch = true
        }
    }
}
