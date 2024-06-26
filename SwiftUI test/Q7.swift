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
    private var task = "Bunions"
    @EnvironmentObject var answer : UserAnswer
    @State private var nextQuesion = false


    
    
    var body: some View {

        VStack {
            ZStack {
                VStack(spacing : 30) {
                    ProgressBar2(progess: 7)

                Image("bunions")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 240, height: 200)
                    .clipped()
                    Text("Does the patient have bunions?")
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
                            answer.answerRecord[6] = "Yes"
                            
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
                            answer.answerRecord[6] = "No"
                            
                        })
                    }
                }
                
            }
            .padding()
            .navigationTitle("Bunions")
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
