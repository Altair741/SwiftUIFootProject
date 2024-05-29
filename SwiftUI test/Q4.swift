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
    private var task = "Ulcer"
    @State private var showMedicalInfo = false
    @EnvironmentObject var answer : UserAnswer
    @State private var nextQuesion = false

    
    var body: some View {
        VStack {
            ZStack {
                VStack(spacing : 30) {
                    ProgressBar2(progess: 16)

                    Image("Ulcer")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 240, height: 200)
                        .clipped()
                    
                    Text("Has the patient had a previous or current ulcer?")

                    HStack {
                            Text("Yes")
                                .padding()
                                .frame(width: 120, height: 50)
                                .background(isSelected ? Color.green : Color.gray)
                                .foregroundColor(.white)
                                .cornerRadius(25)
                        
                        .simultaneousGesture(TapGesture().onEnded {
                            isSelected = true
                            isSelected2 = false
                            nextQuesion = true
                            answer.answerRecord[3] = "Yes"

                        }
                        )
                        
                            Text("No")
                                .padding()
                                .frame(width: 120, height: 50)
                                .background(isSelected2 ? Color.red : Color.gray)
                                .foregroundColor(.white)
                                .cornerRadius(25)
                        
                        .simultaneousGesture(TapGesture().onEnded {
                            isSelected = false
                            isSelected2 = true
                            nextQuesion = true
                            answer.answerRecord[3] = "No"

                        })
                    }
                }
                
            }
            .padding()
            
            .navigationTitle("Ulcer")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            showMedicalInfo.toggle();
                        } label: {
                            Label("MediInfo", systemImage: "cross.circle.fill")
                        }
                    }
            }

            .popover(isPresented: $showMedicalInfo) {
                VStack {
                   MedicalInfoPopUp(medicalInfoString: medicalInfoScript, task: task)
                }

            }
        }
    }
}
