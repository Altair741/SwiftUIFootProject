//
//  Basic_assessment.swift
//  FootTest
//
//  Created by 강민구 on 25/5/2024.
//

import SwiftUI

struct Basic_assessment: View {
    @State private var isSelected = false
    
    let questions: [QuestionData] = [
        QuestionData(question: "What kind of shoes is the patient wearing today?", imageName: nil, buttonLabels: ["Closed Shoe", "Open shoes"]),
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
    
    
    var body: some View {
        Spacer().navigationBarBackButtonHidden(true)
        Spacer()
        NavigationView{
            ZStack{
                Color.green.ignoresSafeArea()
                
                VStack{
                    Text("Basic Assessment")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .font(.system(size: 100))
                    
                    NavigationLink(destination: AskSectionView(questions: questions)){
                        Text("Start Assessment")
                            .frame(width: 200, height: 50)
                            .background(isSelected ? Color.green : Color.gray)
                            .cornerRadius(10)
                    }
                }
            }
        }
    }
}






