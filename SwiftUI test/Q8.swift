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
        
        VStack {
            ZStack {
                VStack(spacing : 30) {
                Image("clawed_toes")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 240, height: 200)
                    .clipped()
                    Text("Does the patient have hammer and clawed toes?")
                    ProgressBar2(progess: 20)
                    
                    HStack {
                        NavigationLink(destination: Q9()) {
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
                            answer.answerRecord[7] = "Yes"
                            
                        }
                        )
                        
                        NavigationLink(destination: Q9()) {
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
                            answer.answerRecord[7] = "No"
                            
                        })
                    }
                }
            }
            .padding()
            .offset(y:-60)
            .navigationTitle("Skin Q.8")
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
                                Text(medicalInfoScript)
                                    .padding()
                                    .multilineTextAlignment(.center)
                                Spacer()
                            }
                        }

        }
    }
}
