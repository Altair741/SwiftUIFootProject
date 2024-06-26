//
//  Q9.swift
//  ICT_footassessment
//
//  Created by 강민구 on 29/4/2024.
//

import SwiftUI

struct Q9: View {
    
    @State private var isSelected = false
    @State private var isSelected2 = false
    @State private var medicalInfoScript = "People with flat feet can take up more pressure through the foot and into the leg causing knee, hip or back pain. This causes strain on the muscles and joints."
    @State private var showMedicalInfo = false
    private var task = "Flat feet"
    @EnvironmentObject var answer : UserAnswer
    @State private var nq = false

    
    var body: some View {
        VStack {
            ZStack {
                VStack(spacing : 30) {
                    ProgressBar2(progess: 9)

                Image("flat_feet")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 240, height: 200)
                    .clipped()
                    Text("Does the patient have flat feet?")
                    
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
                            nq = true
                            answer.answerRecord[8] = "Yes"
                            
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
                            nq = true
                            answer.answerRecord[8] = "No"
                            
                        })
                    }
                }
                
            }
            .padding()
            .navigationTitle("Flat feet")
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
