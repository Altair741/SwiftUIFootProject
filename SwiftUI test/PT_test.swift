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
    
    private var task = "DP_test"
    
    @State private var showMedicalInfo = false
    @State private var nextQuesion = false
    @EnvironmentObject var answer : UserAnswer
    @State private var player = AVPlayer()
    
    
    var body: some View {
        Spacer()
            .navigationBarBackButtonHidden(true)
        Spacer()
        NavigationView {
            
            VStack(spacing: 30) {
                
                HStack{
                    VideoPlayer(player: AVPlayer(url: Bundle.main.url(forResource: "PT_test", withExtension:"mp4")!))
                        .edgesIgnoringSafeArea(.all)
                }
                
                Text("Can you feel the pulse in the posterior tibial")
                ProgressBar2(progess: 3)
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
                Button("Save Anwser"){
                    nextQuesion = true
                }
                    .padding(.leading, 10)
                    .navigationBarBackButtonHidden(true)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button {
                                showMedicalInfo.toggle();
                            } label: {
                                Label("MediInfo", systemImage: "cross.circle.fill")
                            }
                        }
                        ToolbarItem(placement: .navigationBarLeading) {
                            NavigationLink(destination: DP_test()){
                                Button {
                                    
                                } label: {
                                    Label("", systemImage: "arrow.left")
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
                        Monofilament_test()
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
