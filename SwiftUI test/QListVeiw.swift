import SwiftUI

struct QuestionItem: Identifiable {
    let id = UUID()
    let task: String
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
        AnyView(Monofilament_test()),
        AnyView(IPSWICH_test())
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
        QuestionItem(task: "Monofilament Test", view: AnyView(Monofilament_test())),
        QuestionItem(task: "IPSWICH touch test", view: AnyView(IPSWICH_test()))
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                taskView[currentViewOrder]
                
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
                            if taskList[currentViewOrder].task == "PT test" && !isAnswered{
                                checkQuestionCompletion_PT_test()
                            }
                            else if taskList[currentViewOrder].task == "DP test" && !isAnswered{
                                checkQuestionCompletion_DP_test()
                                
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
