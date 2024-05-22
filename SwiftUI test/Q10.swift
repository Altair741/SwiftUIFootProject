//
//  Q10.swift
//  ICT_footassessment
//
//  Created by 강민구 on 29/4/2024.
//

import SwiftUI

struct Q10: View {
    
    @State private var isSelected = false
    @State private var isSelected2 = false
    @State private var medicalInfoScript = "Can be developed over time due to diabetes. As high arched feet aren’t flexible, there is less shock absorption, causing increased pressure on certain areas of the feet causing damage to skin layers."
    @State private var showMedicalInfo = false
    private var task = "Q10"
    @EnvironmentObject var answer : UserAnswer
    @State private var nq = false
    
    
    var body: some View {
        VStack {
            ZStack {
                VStack(spacing : 30) {
                Image("higharched_feet")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 240, height: 200)
                    .clipped()
                    Text("Does the patient have high arched feet?")
                    ProgressBar2(progess: 22)
                    
                    HStack {
                        NavigationLink(destination: Q11()) {
                            Text("Yes")
                                .padding()
                                .frame(width: 120, height: 50)
                                .background(isSelected ? Color.green : Color.gray)
                                .foregroundColor(.white)
                                .cornerRadius(25)
                        }
                        .simultaneousGesture(TapGesture().onEnded {
                            isSelected = true
                            isSelected2 = false
                            nq = true
                            answer.answerRecord[9] = "Yes"
                            
                        }
                        )
                        
                        NavigationLink(destination: Q11()) {
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
                            nq = true
                            answer.answerRecord[9] = "No"
                            
                        })
                    }
                }
                
            }
            .padding()
            .offset(y:-60)
            .navigationTitle("Skin Q.10")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showMedicalInfo.toggle();
                    } label: {
                        Label("MediInfo", systemImage: "cross.circle.fill")
                    }
                }
            }
            .fullScreenCover(isPresented: $showMedicalInfo)
            {
                MedicalInfoPopUp(medicalInfoString: medicalInfoScript, task: task)
            }
        }
        
    }
}
