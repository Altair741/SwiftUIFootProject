//
//  DP_test.swift
//  ICT_footassessment
//
//  Created by 강민구 on 11/5/2024.
//

import SwiftUI
import AVKit

struct PT_test: View {
    
    @State private var isSelected = false
    @State private var isSelected2 = false
    @State private var isSelected3 = false
    @State private var isSelected4 = false
    @State private var medicalInfoScript = "For the following check you may not be able to find the pulse if there is a lot of swelling around the ankle and if the arteries are deep, if you cannot feel a pulse and you think the patient may have circulation problems refer them to the local doctor. Check right foot first. "
    
    private var task = "PT_test"
    @State private var showModal: Bool = false
    @State private var showMedicalInfo = false
    @State private var showPictorialResources = false
    @State private var nextQuesion = false
    @EnvironmentObject var answer : UserAnswer
    @State private var player = AVPlayer()

    init() {
        print("PT_test initialized")
    }
    
    var body: some View {

            ScrollView{

                VStack(spacing: 30) {
                    
                    Image("PT_test_spot")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 240, height: 200)
                        .clipped()
                    
                    Text("Can you feel the pulse in the posterior tibial")
                    ProgressBar2(progess: 26)
                    Text("Right Foot")
                    
                    HStack {
                        
                        Button("Yes") {
                            isSelected = true
                            isSelected2 = false
                            answer.answerRecord[14] = "Yes"
                            player.pause()
                        }
                        .buttonStyle(SelectedButtonStyle(isSelected: isSelected))
                        
                        Button("No") {
                            isSelected2 = true
                            isSelected = false
                            answer.answerRecord[14] = "No"
                            player.pause()
                            
                        }
                        .buttonStyle(SelectedButtonStyle(isSelected: isSelected2))
                    }
                    .padding(.leading, 10)
                    
                    Text("Left Foot")
                    HStack {
                        Button("Yes") {
                            isSelected3 = true
                            isSelected4 = false
                            answer.answerRecord[15] = "Yes"
                            player.pause()
                        }
                        .buttonStyle(SelectedButtonStyle(isSelected: isSelected3))
                        
                        Button("No") {
                            isSelected4 = true
                            isSelected3 = false
                            answer.answerRecord[15] = "No"
                            player.pause()
                            
                        }
                        .buttonStyle(SelectedButtonStyle(isSelected: isSelected4))
                    }
                    
                    NavigationLink(destination: MyModal(showModal: $showModal)) {
                        Text("Save Answer")
                    }

                    .padding(.leading, 10)
                    .navigationTitle("PT Test")
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button {
                                showMedicalInfo.toggle();
                            } label: {
                                Label("MediInfo", systemImage: "info.circle")
                            }
                        }
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button {
                                showPictorialResources.toggle();
                            } label: {
                                Label("PictorialVideo", systemImage: "play.circle.fill")
                            }
                        }
                    }
                    
                }.popover(isPresented: $showMedicalInfo) {
                    VStack {
                        Text(medicalInfoScript)
                            .padding()
                            .multilineTextAlignment(.center)
                        Spacer()
                    }
                }

                .fullScreenCover(isPresented: $showPictorialResources)
                {
                    ZStack {
                        WithPictorial(videoName: "PT_test")
                            .navigationBarItems(leading: Button(action: {
                                showPictorialResources = false
                            })
                                                {
                                Image(systemName: "chevron.left")
                                Text("Back")
                            }
                            )
                    }
                }
                
            }
        }
        
    }

