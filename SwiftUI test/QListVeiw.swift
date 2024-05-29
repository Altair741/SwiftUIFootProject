import SwiftUI

//AskSectionView(questions: questions)

struct QuestionItem: Identifiable {
    let id = UUID()
    let task: String
    let view: AnyView
}

struct QListView: View {
    @State private var isQuestionListExpanded = false
    @State private var currentViewOrder = 0
    

    let taskView : [AnyView] = [
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
        AnyView(PT_test()),
        AnyView(DP_test()),
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
        QuestionItem(task: "Charoct foot", view: AnyView(Q11())),
        QuestionItem(task: "Amputation", view: AnyView(Q12())),
        QuestionItem(task: "PT test", view: AnyView(PT_test())),
        QuestionItem(task: "DP test", view: AnyView(DP_test())),
        QuestionItem(task: "Monofilament Test", view: AnyView(Monofilament_test())),
        QuestionItem(task: "IPSWICH touch test", view: AnyView(IPSWICH_test()))
    ]
    
    var body: some View {
        
        VStack{
  
            self.taskView[currentViewOrder]
            
            DisclosureGroup("Jump to Question", isExpanded: $isQuestionListExpanded) {
                List(taskList) { question in
                    NavigationLink(destination: question.view) {
                        Text(question.task)
                    }
                }
                .frame(height: isQuestionListExpanded ? 200 : 0)
                .clipped()
            }
        }
    }
    func nextStep()
    {
        currentViewOrder += 1
    }
}

struct QListView_Previews: PreviewProvider {
    static var previews: some View {
        QListView()
            .environmentObject(UserAnswer())
    }
}
