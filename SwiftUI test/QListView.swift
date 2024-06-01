
import SwiftUI

struct QuestionItem: Identifiable {
    let id = UUID()
    let task: String
    let index: Int
    let view: AnyView
}

struct QListView: View {
    @State private var isQuestionListExpanded = false
    @State private var currentViewOrder = 0
    @EnvironmentObject var answer : UserAnswer
    @State private var showAlert = false
    @State private var isAnswered = false
    
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
        AnyView(IPSWICH_test())
    ]
    
    let taskList: [QuestionItem] = [
        QuestionItem(task: "Callus", index:0,view: AnyView(Q1())),
        QuestionItem(task: "Corns", index:1,view: AnyView(Q2())),
        QuestionItem(task: "Tinea", index:2,view: AnyView(Q3())),
        QuestionItem(task: "Ulcer", index:3,view: AnyView(Q4())),
        QuestionItem(task: "Thickened toenails", index:4,view: AnyView(Q5())),
        QuestionItem(task: "Ingrown toenails", index:5,view: AnyView(Q6())),
        QuestionItem(task: "Bunions", index:6,view: AnyView(Q7())),
        QuestionItem(task: "Clawed toes", index:7,view: AnyView(Q8())),
        QuestionItem(task: "Flat feet", index:8,view: AnyView(Q9())),
        QuestionItem(task: "High arched feet", index:9,view: AnyView(Q10())),
        QuestionItem(task: "Charcot foot",index:10, view: AnyView(Q11())),
        QuestionItem(task: "Amputation", index:11,view: AnyView(Q12())),
        QuestionItem(task: "DP test", index:12,view: AnyView(DP_test())),
        QuestionItem(task: "PT test", index:13,view: AnyView(PT_test())),
        QuestionItem(task: "MyModal", index:14,view: AnyView(MyModal())),
        QuestionItem(task: "Monofilament Test", index:15,view: AnyView(Monofilament_test())),
        QuestionItem(task: "IPSWICH touch test",index:16, view: AnyView(IPSWICH_test()))
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                // Display the current question view based on taskList
                taskList[currentViewOrder].view
                
                // Navigation Buttons (Modified)
                HStack {
                    Button(action: {
                        withAnimation {
                            // Find the index of the previous question in taskList using the id property
                            if let prevIndex = taskList.firstIndex(where: { $0.id == taskList[currentViewOrder].id }), prevIndex > 0 {
                                currentViewOrder = prevIndex - 1
                            } else {
                                currentViewOrder = taskList.count - 1
                            }
                        }
                    }) {
                        Text("Back")
                            .padding()
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        withAnimation {
                            if taskList[currentViewOrder].task == "PT test" && !isAnswered {
                                checkQuestionCompletion_PT_test()
                            } else if taskList[currentViewOrder].task == "DP test" && !isAnswered {
                                checkQuestionCompletion_DP_test()
                            } else if taskList[currentViewOrder].task == "MyModal" {
                                if checkMedicalTool() {
                                    // Find the index of the next question in taskList using id
                                    if let nextIndex = taskList.firstIndex(where: { $0.id == taskList[currentViewOrder].id }), nextIndex < taskList.count - 1 {
                                        currentViewOrder = nextIndex + 1
                                    } else {
                                        currentViewOrder = 0
                                    }
                                } else {
                                    // Find the index of the next question after skipping in taskList using id
                                    if let nextIndex = taskList.firstIndex(where: { $0.id == taskList[currentViewOrder].id }), nextIndex < taskList.count - 2 {
                                        currentViewOrder = nextIndex + 2
                                    } else {
                                        currentViewOrder = 0
                                    }
                                }
                            } else {
                                // Find the index of the next question in taskList using id
                                if let nextIndex = taskList.firstIndex(where: { $0.id == taskList[currentViewOrder].id }), nextIndex < taskList.count - 1 {
                                    currentViewOrder = nextIndex + 1
                                } else {
                                    currentViewOrder = 0
                                }
                            }
                        }
                    }) {
                        Text("Next")
                            .padding()
                    }
                    .padding()
                    
                    
                    DisclosureGroup("Jump to Question", isExpanded: $isQuestionListExpanded) {
                        List(taskList) { question in
                            Button(action: {
                                if let index = taskList.firstIndex(where: { $0.id == question.id }) {
                                    if answer.answerRecord.count > index && answer.answerRecord[index] != "Not Answered" {
                                        currentViewOrder = index
                                        isQuestionListExpanded = false
                                    } else if index <= currentViewOrder {  // Allow going back
                                        currentViewOrder = index
                                        isQuestionListExpanded = false
                                    } else {
                                        showAlert = true // Show alert if trying to skip ahead
                                    }
                                }
                            }) {
                                HStack {
                                    Text("\(taskList.firstIndex(where: { $0.id == question.id })! + 1)")
                                        .frame(minWidth: 20, alignment: .leading)
                                        .foregroundColor(taskList.firstIndex(where: { $0.id == question.id }) == currentViewOrder ? Color.blue : Color.primary)
                                    
                                    Spacer()
                                    
                                    Text(question.task)
                                        .font(.caption)
                                    
                                    Spacer()
                                    
                                    // Tick Mark (Dynamic)
                                    if answer.answerRecord.count > taskList.firstIndex(where: { $0.id == question.id })! && answer.answerRecord[taskList.firstIndex(where: { $0.id == question.id })!] != "Not Answered" {
                                        Image(systemName: "checkmark.circle.fill")
                                            .foregroundColor(.green)
                                    }
                                }
                            }
                        }
                        .frame(height: isQuestionListExpanded ? 200 : 0)
                        .clipped()
                    }
                    .padding()
                }
                .navigationBarTitle("Examination", displayMode: .inline)
                .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("Not completed!"),
                        message: Text("Please, enter the answer."),
                        dismissButton: .default(Text("OK"))
                    )
                }
            }
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
        func checkQuestionCompletion_PT_test()
        {
            if answer.answerRecord[14] == "Not Answered" || answer.answerRecord[15] == "Not Answered"
            {
                showAlert = true
            }
            
            if answer.answerRecord[14] != "Not Answered" || answer.answerRecord[15] != "Not Answered"
            {
                showAlert = false
                isAnswered = true
            }
        }
        func checkQuestionCompletion_DP_test()
        {
            if answer.answerRecord[12] == "Not Answered" || answer.answerRecord[13] == "Not Answered"
            {
                showAlert = true
            }
            
            if answer.answerRecord[12] != "Not Answered" || answer.answerRecord[13] != "Not Answered"
            {
                showAlert = false
                isAnswered = true
            }
        }
        
    
    
}
    
