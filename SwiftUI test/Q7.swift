//
//  Q7.swift
//  ICT_footassessment
//
//  Created by 강민구 on 29/4/2024.
//

import SwiftUI

struct Q7: View {
    
    @State private var isSelected = false
    @State private var isSelected2 = false
    @State private var medicalInfoScript = "When a patient with bunions tries to wear smaller sized shoes, this causes pressure and rubbing leading to infections."
    @State private var showMedicalInfo = false
    private var task = "Q7"
    @EnvironmentObject var answer : UserAnswer
    @State private var nextQuesion = false


    
    
    var body: some View {
        Spacer()
        .navigationBarBackButtonHidden(true)
        Spacer()
        NavigationView {
            ZStack {
                VStack(spacing: 30) {
                    Text("Does the patient have bunions?")
                    ProgressBar2(progess: 7)

                    HStack {
                        Button("Yes") {
                            isSelected = true
                            isSelected2 = false
                            nextQuesion = true
                            answer.answerRecord[6] = "Yes"
                        }
                        .buttonStyle(SelectedButtonStyle(isSelected: isSelected))
                        
                        Button("No") {
                            isSelected2 = true
                            isSelected = false
                            nextQuesion = true
                            answer.answerRecord[6] = "No"
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
                        NavigationLink(destination: Q6()){
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
                    Q8()
                }
            }
        }
    }
}
