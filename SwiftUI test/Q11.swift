//
//  Q11.swift
//  ICT_footassessment
//
//  Created by 강민구 on 29/4/2024.
//

import SwiftUI

struct Q11: View {
    
    @State private var isSelected = false
    @State private var isSelected2 = false
    @State private var medicalInfoScript = "This can happen when someone has diabetic neuropathy, where there is a loss of sensation, but circulation is still present. The structure of the foot can change permanently."
    @State private var showMedicalInfo = false
    private var task = "Charcot Foot"
    @EnvironmentObject var answer : UserAnswer
    @State private var nq = false

    
    var body: some View {

        VStack {
            ZStack {
                VStack(spacing : 30) {
                    ProgressBar2(progess: 11)

                Image("Charcot_foot")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 240, height: 200)
                    .clipped()
                    Text("Does the patient have Charcot foot?")

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
                            answer.answerRecord[10] = "Yes"

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
                            answer.answerRecord[10] = "No"

                        })
                    }
                }
                .padding()
                .navigationTitle("Charcot foot")
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
}
