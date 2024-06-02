// import SwiftUI

// struct QuestionItem: Identifiable {
//     let id = UUID()
//     let task: String
//     let view: AnyView
// }

// struct QListView: View {
//     @State private var assessmentTaskDone = false
//     @State private var isQuestionListExpanded = false
//     @State private var currentViewOrder = 0
//     @EnvironmentObject var answer : UserAnswer
//     @State private var showAlert = false
//     @State private var isAnsweredDP = false
//     @State private var isAnsweredPT = false
//     @State private var isAnsweredMono = false
//     @State private var isAnsweredSwitch = false



//     let taskView: [AnyView] = [
//         AnyView(Q1()),
//         AnyView(Q2()),
//         AnyView(Q3()),
//         AnyView(Q4()),
//         AnyView(Q5()),
//         AnyView(Q6()),
//         AnyView(Q7()),
//         AnyView(Q8()),
//         AnyView(Q9()),
//         AnyView(Q10()),
//         AnyView(Q11()),
//         AnyView(Q12()),
//         AnyView(DP_test()),
//         AnyView(PT_test()),
//         AnyView(MyModal()),
//         AnyView(Monofilament_test()),
//         AnyView(IPSWICH_test()),
//         AnyView(RiskCalculator()),
//         AnyView(SignInView())
//     ]
    
//     let taskList: [QuestionItem] = [
//         QuestionItem(task: "Callus", view: AnyView(Q1())),
//         QuestionItem(task: "Corns", view: AnyView(Q2())),
//         QuestionItem(task: "Tinea", view: AnyView(Q3())),
//         QuestionItem(task: "Ulcer", view: AnyView(Q4())),
//         QuestionItem(task: "Thickened toenails", view: AnyView(Q5())),
//         QuestionItem(task: "Ingrown toenails", view: AnyView(Q6())),
//         QuestionItem(task: "Bunions", view: AnyView(Q7())),
//         QuestionItem(task: "Clawed toes", view: AnyView(Q8())),
//         QuestionItem(task: "Flat feet", view: AnyView(Q9())),
//         QuestionItem(task: "High arched feet", view: AnyView(Q10())),
//         QuestionItem(task: "Charcot foot", view: AnyView(Q11())),
//         QuestionItem(task: "Amputation", view: AnyView(Q12())),
//         QuestionItem(task: "DP test", view: AnyView(DP_test())),
//         QuestionItem(task: "PT test", view: AnyView(PT_test())),
//         QuestionItem(task: "MyModal", view: AnyView(MyModal())),
//         QuestionItem(task: "Monofilament test", view: AnyView(Monofilament_test())),
//         QuestionItem(task: "IPSWICH touch test", view: AnyView(IPSWICH_test())),
//         QuestionItem(task: "Risk", view: AnyView(RiskCalculator())),
//         QuestionItem(task: "SignInView", view: AnyView(SignInView()))
//     ]
    
//     var body: some View {
        
//         NavigationView {
            
//             VStack {
//                 taskView[currentViewOrder]
                
//                 HStack {
//                     Button(action: {
//                         withAnimation {
                            
//                             currentViewOrder -= 1
//                             if currentViewOrder < 0 {
//                                 currentViewOrder = taskView.count - 1
//                             }
                            
                            
//                         }
//                     }) {
//                         Text("Back")
//                             .padding()
//                     }
//                     Spacer()
                    
//                     Button(action: {
//                         withAnimation {
                            
                            
    
//                             if taskList[currentViewOrder].task == "DP test" && !isAnsweredDP{
//                                 checkQuestionCompletion_DP_test()
//                             }
//                             else if taskList[currentViewOrder].task == "PT test" && !isAnsweredPT{
//                                 checkQuestionCompletion_PT_test()

//                             }
//                             else if taskList[currentViewOrder].task == "Monofilament test" {
//                                 checkQuestionCompletion_MonoTest()
//                                 if(isAnsweredMono)
//                                 {
//                                     currentViewOrder += 2

//                                 }
                                
//                             }
                            
//                             else if taskList[currentViewOrder].task == "IPSWICH touch test" && !isAnsweredSwitch{
//                                 checkQuestionCompletion_SWTCH()
//                             }
                            
//                             else if taskList[currentViewOrder].task == "MyModal"
//                             {
//                                 if(checkMedicalTool())
//                                 {
//                                     currentViewOrder += 1
                                    
//                                     if currentViewOrder >= taskView.count {
//                                         currentViewOrder = 0
//                                     }
//                                 }
//                                 else{
//                                     currentViewOrder += 2
                                    
//                                     if currentViewOrder >= taskView.count {
//                                         currentViewOrder = 0
//                                     }
//                                 }
//                             }
//                             else {
//                                 currentViewOrder += 1
                                
//                                 if currentViewOrder >= taskView.count {
//                                     currentViewOrder = 0
//                                 }
//                             }
//                         }
//                     }) {
//                         Text("Next")
//                             .padding()
//                     }
                    
//                 }
//                 .padding()
//                 DisclosureGroup("Jump to Question", isExpanded: $isQuestionListExpanded) {
//                     List(taskList) { question in
//                         Button(action: {
//                             if let index = taskList.firstIndex(where: { $0.id == question.id }) {
//                                 currentViewOrder = index
//                                 isQuestionListExpanded = false
//                             }
//                         }) {
//                             Text(question.task)
//                         }
//                     }
//                     .frame(height: isQuestionListExpanded ? 200 : 0)
//                     .clipped()
//                 }
//                 .padding()
//             }
//             // when Vstak shows
//             .navigationBarTitle("Examination", displayMode: .inline)
//             .alert(isPresented: $showAlert) {
//                 if taskList[currentViewOrder].task == "Monofilament test" || taskList[currentViewOrder].task == "IPSWICH touch test"
//                 {
//                     Alert(
//                         title: Text("Not completed!"),
//                         message: Text("Please, enter the answer and make sure save the answer with the yellow button."),
//                         dismissButton: .default(Text("OK"))
//                     )
//                 }
//                 else {
//                     Alert(
//                         title: Text("Not completed!"),
//                         message: Text("Please, enter the answer."),
//                         dismissButton: .default(Text("OK"))
//                     )}
//             }
//         }
        
//     }
    
//     func allTaskDone()
//     {
//         if (answer.checkCompletion())
//         {
//             assessmentTaskDone = true
//         }
//     }
    
//     func checkMedicalTool() -> Bool
//     {
//         if answer.haveMedicalTool == "yes" {
//             return true
//         }
//         else {
//             return false
//         }
//     }
//     func checkQuestionCompletion_DP_test() {
//        if answer.answerRecord[12] == "Not Answered" || answer.answerRecord[13] == "Not Answered" {
//          showAlert = true
//            isAnsweredDP = false
//        } else {
//            isAnsweredDP = true
//        }
//      }
//     func checkQuestionCompletion_PT_test() {
//         if answer.answerRecord[14] == "Not Answered" || answer.answerRecord[15] == "Not Answered" {
//             DispatchQueue.main.async {
//                 showAlert = true
//                 isAnsweredPT = false
//             }
//         } else {
//             isAnsweredPT = true
//         }
//     }
    
//     func checkQuestionCompletion_MonoTest() {
//         if answer.answerRecord[16] == "Not Answered"{
//             DispatchQueue.main.async {
//                 showAlert = true
//                 isAnsweredMono = false
//             }
//         } else {
//             isAnsweredMono = true
//         }
//     }
    
//     func checkQuestionCompletion_SWTCH() {
//         if answer.answerRecord[17] == "Not Answered"{
//             DispatchQueue.main.async {
//                 showAlert = true
//                 isAnsweredSwitch = false
//             }
//         } else {
//             isAnsweredSwitch = true
//         }
//     }
    
    
    
// }

import SwiftUI

struct QuestionItem: Identifiable {
    let id = UUID()
    let task: String
    let view: AnyView
}

struct QListView: View {
    @State private var assessmentTaskDone = false
    @State private var isQuestionListExpanded = false
    @State private var currentViewOrder = 0
    @EnvironmentObject var answer : UserAnswer
    @State private var showAlert = false
    @State private var isAnsweredDP = false
    @State private var isAnsweredPT = false
    @State private var isAnsweredMono = false
    @State private var isAnsweredSwitch = false



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
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                taskView[currentViewOrder]
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
                    }
                    
                }
                .padding()
                .padding()
            }
            // when Vstak shows
            .navigationBarTitle("Examination", displayMode: .inline)
            .alert(isPresented: $showAlert) {
                if taskList[currentViewOrder].task == "Monofilament test" || taskList[currentViewOrder].task == "IPSWICH touch test"
                {
                    Alert(
                        title: Text("Not completed!"),
                        message: Text("Please, enter the answer and make sure save the answer with the yellow button."),
                        dismissButton: .default(Text("OK"))
                    )
                }
                else {
                    Alert(
                        title: Text("Not completed!"),
                        message: Text("Please, enter the answer."),
                        dismissButton: .default(Text("OK"))
                    )}
            }
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

