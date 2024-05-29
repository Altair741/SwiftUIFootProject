//
//  Q1.swift
//  ICT_footassessment
//
//  Created by 강민구 on 3/4/2024.
//

import SwiftUI


struct SelectedButtonStyle: ButtonStyle {
    var isSelected: Bool
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .frame(width: 120, height: 50)
            .background(isSelected ? Color.green : Color.gray)
            .foregroundColor(.white)
            .cornerRadius(25)
    }
}
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

struct Q1: View {
    @State private var isSelected = false
    @State private var isSelected2 = false
    @State private var medicalInfoScript = "Callus/Fissures are caused by cracks in the skin which go deep enough to cause bleeding. For patients diagnosed with diabetes, they may not be able to feel the pain causing further injuries and ulcers."
    @State private var showMedicalInfo = false
    // to use controll screen to be full
    @State private var nextQuesion = false
    // Record User answer
    @EnvironmentObject var answer : UserAnswer
    @State private var isQuestionListExpanded = false
    
    
    private var task = "Callus"
    
    
    
    //data
    
    
    var body: some View {
        ZStack{
            
            VStack(spacing : 30) {
                ProgressBar2(progess: 13)
                
                Image("callus")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 260, height: 200)
                    .clipped()
                Text("Does the patient have callus?")
                HStack {
                    NavigationLink(destination: Q2()) {
                        Text("Yes")
                            .padding()
                            .frame(width: 120, height: 50)
                            .background(isSelected ? Color.green : Color.gray)
                            .foregroundColor(.white)
                            .cornerRadius(25)
                    }
                    
                    .padding(0.0)
                    .simultaneousGesture(TapGesture().onEnded {
                        isSelected = true
                        isSelected2 = false
                        nextQuesion = true
                        answer.answerRecord[0] = "Yes"
                        
                    }
                    )
                    NavigationLink(destination: Q2()) {
                        Text("No")
                            .padding()
                            .frame(width: 120, height: 50)
                            .background(isSelected2 ? Color.red : Color.gray)
                            .foregroundColor(.white)
                            .cornerRadius(25)
                    }
                    .simultaneousGesture(TapGesture().onEnded {
                        isSelected = false
                        isSelected2 = true
                        nextQuesion = true
                        answer.answerRecord[0] = "No"
                    })
                }
     
                
            }// end ZStack
            
            .navigationTitle("Callus")
            .offset(y:-60)
            .popover(isPresented: $showMedicalInfo) {
                VStack {
                    MedicalInfoPopUp(medicalInfoString: medicalInfoScript, task: task)
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showMedicalInfo.toggle();
                    } label: {
                        Label("MediInfo", systemImage: "cross.circle.fill")
                    }
                    
                }
            }
        }
    }
    
    
    struct Q1_Previews: PreviewProvider {
        static var previews: some View{
            Q1()
        }
    }
}
