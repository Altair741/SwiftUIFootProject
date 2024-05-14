//
//  Q4.swift
//  ICT_footassessment
//
//  Created by 강민구 on 3/4/2024.
//

import SwiftUI

struct Q4: View {
    @State private var isSelected = false
    @State private var isSelected2 = false
    @State private var medicalInfoScript = "The damage would build up on their foot as they would have no feeling. They can be initially caused by injuries or from pressure."
    private var task = "Q4"
    @State private var showMedicalInfo = false
    @EnvironmentObject var answer : UserAnswer
    @State private var nextQuesion = false

    
    var body: some View {
        Spacer()
        .navigationBarBackButtonHidden(true)
        Spacer()
        NavigationView {
            ZStack {
                VStack(spacing: 30) {
                    Text("Has the patient had a previous or current ulcer?")
                    ProgressBar2(progess: 4)

                    HStack {
                        Button("Yes") {
                            isSelected = true
                            isSelected2 = false
                            nextQuesion = true
                            answer.answerRecord[3] = "Yes"
                        }
                        .buttonStyle(SelectedButtonStyle(isSelected: isSelected))
                        
                        Button("No") {
                            isSelected2 = true
                            isSelected = false
                            nextQuesion = true
                            answer.answerRecord[3] = "No"
                        }
                        .buttonStyle(SelectedButtonStyle(isSelected: isSelected2))
                    }
                }
                .padding()
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                            Button {
                                showMedicalInfo.toggle();
                            } label: {
                                Label("MediInfo", systemImage: "cross.circle.fill")
                            }
                        }
                    ToolbarItem(placement: .navigationBarLeading) {
                        NavigationLink(destination: Q3()){
                            Button {
                                
                            } label: {
                                Label("", systemImage: "arrow.left")
                            }
                            
                        }
                    }
                    }
                
                .fullScreenCover(isPresented: $showMedicalInfo)
                {
                    MedicalInfoPopUp(medicalInfoString: medicalInfoScript, task: task)
                }
                .fullScreenCover(isPresented: $nextQuesion)
                {
                    Q5()
                }

            }
        }
    }
}
