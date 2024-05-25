//
//  DP_test.swift
//  ICT_footassessment
//
//  Created by 강민구 on 11/5/2024.
//

import SwiftUI
import AVKit

struct DP_test: View {
    
    @State private var isSelected = false
    @State private var isSelected2 = false
    @State private var isSelected3 = false
    @State private var isSelected4 = false
    @State private var isSaved = false
    
    @State private var medicalInfoScript = "For the following check you may not be able to find the pulse if there is a lot of swelling around the ankle and if the arteries are deep, if you cannot feel a pulse and you think the patient may have circulation problems refer them to the local doctor. Check right foot first."
    
    private var task = "DP_test"
    @State private var showPictorialResources = false
    @State private var showMedicalInfo = false
    @State private var nextQuesion = false
    @EnvironmentObject var answer : UserAnswer
    @State private var player = AVPlayer()
    
    
    var body: some View {

        VStack{
            ScrollView{
            VStack {

                    VStack(spacing: 30) {
                        
                        
                        Image("DP_test_spot")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 240, height: 200)
                            .clipped()
                        
                        Text("Can you feel the pulse in the dorsalis pedis")
                        ProgressBar2(progess: 3)
                        Text("Right Foot")
                        
                        HStack {
                            Button("Yes") {
                                isSelected = true
                                isSelected2 = false
                                answer.answerRecord[12] = "Yes"
                                player.pause()
                            }
                            .buttonStyle(SelectedButtonStyle(isSelected: isSelected))
                            
                            Button("No") {
                                isSelected2 = true
                                isSelected = false
                                answer.answerRecord[12] = "No"
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
                                answer.answerRecord[13] = "Yes"
                                player.pause()
                            }
                            .buttonStyle(SelectedButtonStyle(isSelected: isSelected3))
                            
                            Button("No") {
                                isSelected3 = false
                                isSelected4 = true
                                answer.answerRecord[13] = "No"
                                player.pause()
                            }
                            .buttonStyle(SelectedButtonStyle(isSelected: isSelected4))
                        }
                        
                        NavigationLink(destination: PT_test()) {
                            Text("Save Anwser")
                        }
                        .padding(.leading, 10)
                        .navigationTitle("DP Test")
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
                        
                    }
                    .popover(isPresented: $showMedicalInfo) {
                                    VStack {
                                        Text(medicalInfoScript)
                                            .padding()
                                            .multilineTextAlignment(.center)
                                        Spacer()
                                    }
                                }

                    .fullScreenCover(isPresented: $showPictorialResources)
                    {
                        NavigationView {
                            WithPictorial(videoName: "DP_test")
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
                .onReceive([nextQuesion].publisher.first()) { _ in
                    player.pause()
                }
                .onDisappear {
                    player.pause()
                }
                .onAppear {
                    player.play()
                }
            }
        }
    }
}

