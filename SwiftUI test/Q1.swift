//
//  Q1.swift
//  ICT_footassessment
//
//  Created by 강민구 on 3/4/2024.
//

import SwiftUI

struct Q1: View {
    
    @State private var isSelected = false
    @State private var isSelected2 = false
    @State private var medicalInfoScript = "Fissures are caused by cracks in the skin which go deep enough to cause bleeding. For patients diagnosed with diabetes, they may not be able to feel the pain causing further injuries and ulcers."
    @State private var showMedicalInfo = false
    // to use controll screen to be full
    @State private var nextQuesion = false
    // Record User answer
    @EnvironmentObject var answer : UserAnswer
    
    private var task = "Q1"
    
    
    var body: some View {
        Spacer()
            .navigationBarBackButtonHidden(true)
        Spacer()
        NavigationView {
            
            ZStack {
                
                // Add aboriginal image here.
                
                    VStack(spacing: 30) {
                        Text("Does the patient have callus?")
                        ProgressBar2(progess: 1)
                        HStack {
                            Button("Yes") {
                                isSelected = true
                                isSelected2 = false
                                nextQuesion = true
                                answer.answerRecord[0] = "Yes"
                            }
                            .buttonStyle(SelectedButtonStyle(isSelected: isSelected))
                            
                            Button("No") {
                                isSelected2 = true
                                isSelected = false
                                nextQuesion = true
                                answer.answerRecord[0] = "No"
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
                        
                    }
                }
                .fullScreenCover(isPresented: $showMedicalInfo)
                {
                    MedicalInfoPopUp(medicalInfoString: medicalInfoScript, task: task)
                }
                .fullScreenCover(isPresented: $nextQuesion)
                {
                    Q2()
                }
            }
        }
    }

