//
//  Q8.swift
//  ICT_footassessment
//
//  Created by 강민구 on 29/4/2024.
//

import SwiftUI

struct Q8: View {
    
    @State private var isSelected = false
    @State private var isSelected2 = false
    @State private var medicalInfoScript = "The part that meets the ground or top of shoes can cause a build-up of callus or corns."
    @State private var showMedicalInfo = false
    private var task = "Q8"
    @EnvironmentObject var answer : UserAnswer
    @State private var nq = false


    
    var body: some View {
        Spacer()
        .navigationBarBackButtonHidden(true)
        Spacer()

        NavigationView {
            ZStack {
                VStack(spacing: 30) {
                    Text("Does the patient have hammer and clawed toes?")
                    ProgressBar2(progess: 8)

                    HStack {
                        Button("Yes") {
                            isSelected = true
                            isSelected2 = false
                            nq = true
                            answer.answerRecord[7] = "Yes"
                        }
                        .buttonStyle(SelectedButtonStyle(isSelected: isSelected))
                        
                        Button("No") {
                            isSelected2 = true
                            isSelected = false
                            nq = true
                            answer.answerRecord[7] = "No"
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
                        NavigationLink(destination: Q7()){
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
                .fullScreenCover(isPresented: $nq)
                {
                    Q9()
                }
            }
        }
    }
}
