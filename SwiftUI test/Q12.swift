//
//  Q12.swift
//  ICT_footassessment
//
//  Created by 강민구 on 29/4/2024.
//

import SwiftUI

struct Q12: View {
    
    @State private var isSelected = false
    @State private var isSelected2 = false
    @State private var medicalInfoScript = "Most amputations occur due to infections that start in the skin and move into the bone and worsens with bad circulation. Patients that have had an amputation would have further risk factors and would need to check their feet and legs daily."
    @State private var showMedicalInfo = false
    @State private var nq = false
    private var task = "Q12"
    @EnvironmentObject var answer : UserAnswer

    
    var body: some View {
        VStack {
            ZStack {
                VStack(spacing: 30) {
                    
                    Image("ampuation")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 260, height: 200)
                        .clipped()
                    
                    Text("Has the patient had any amputations?")
                    ProgressBar2(progess: 24)

                    HStack {
                        NavigationLink(destination: DP_test()) {
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
                            answer.answerRecord[11] = "Yes"

                        }
                        )
                        NavigationLink(destination: DP_test()) {
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
                            answer.answerRecord[11] = "No"

                        })
                    }
                }
                .padding()
                .offset(y:-60)
                .navigationTitle("Skin Q.12")
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
}
