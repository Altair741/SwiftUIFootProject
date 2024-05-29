import SwiftUI

//AskSectionView(questions: questions)

struct QuestionItem: Identifiable {
    let id = UUID()
    let task: String
    let view: AnyView
}

struct QListView: View {
    
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
            
            NavigationView {
                List(taskList) { question in
                    NavigationLink(destination: question.view) {
                        Text(question.task)
                    }
                }
                .navigationTitle("Examination")
                
            }
        }
    }
}

struct QListView_Previews: PreviewProvider {
    static var previews: some View {
        QListView()
            .environmentObject(UserAnswer())
    }
}
