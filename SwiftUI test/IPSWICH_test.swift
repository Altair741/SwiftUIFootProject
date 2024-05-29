//
//  IPSWICH_test.swift
//  FootTest
//
//  Created by 강민구 on 19/5/2024.
//

import SwiftUI

struct IPSWICH_test: View {
    
    
    
    @State private var isSelected_R_1 = false
    @State private var isSelected_R_2 = false
    @State private var isSelected_R_3 = false
    @State private var isSelected_L_1 = false
    @State private var isSelected_L_2 = false
    @State private var isSelected_L_3 = false
    
    @State private var isSelected_R_1_No = false
    @State private var isSelected_R_2_No = false
    @State private var isSelected_R_3_No = false
    @State private var isSelected_L_1_No = false
    @State private var isSelected_L_2_No = false
    @State private var isSelected_L_3_No = false
    @State private var medicalInfoScript = "Lightly touch the indicated parts of the foot and hold for 1 to 2 seconds. Do not press, poke, tap, or stroke. If the response is no, do not try again or press harder. The toes must be touched in the following order."
    private var task = "IPSWICH_touch_test"
    @State private var showMedicalInfo = false
    @State private var nextQuestion = false
    @EnvironmentObject var answer : UserAnswer
    // score value to Right foot
    @State private var score_rf: Int = 0
    @State private var score_lf: Int = 0
    @State private var testRecord: [String] = Array(repeating: "Not Answered", count: 6)
    @State private var showAlert = false
    
    // 16 user answer.
    
    var body: some View {
        
        VStack {
            ScrollView {
                VStack(spacing: 20) {
                    
                    Image("IPSWICH_touch_test_spot")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200, height: 200)
                        .clipped()
                    
                    Text("press the monofilament against the points indicated in the picture ")
                    
                    ProgressBar2(progess: 16)
                    
                    Text("Spot 1: Right first toe")
                        .padding(.leading, -140)
                        .padding(.bottom, -20)
                    
                    HStack {
                        Button("Yes") {
                            isSelected_R_1 = true
                            isSelected_R_1_No = false
                            score_rf += 1
                            testRecord[0] = "yes"
                            
                        }
                        .buttonStyle(SelectedButtonStyle(isSelected: isSelected_R_1))
                        Button("No") {
                            isSelected_R_1 = false
                            isSelected_R_1_No = true
                            answer.IPSWICHScore += 1
                            testRecord[0] = "yes"
                            
                        }
                        .buttonStyle(SelectedButtonStyle(isSelected: isSelected_R_1_No))
                    }.padding(10)
                        .padding(.leading, 10)
                    
                    Text("Spot 2: Right fifth toe ")  .padding(.leading, -135)
                        .padding(.bottom, -20)
                    
                    HStack {
                        Button("Yes") {
                            isSelected_R_2 = true
                            isSelected_R_2_No = false
                            score_rf += 1
                            testRecord[1] = "yes"
                            
                        }
                        .buttonStyle(SelectedButtonStyle(isSelected: isSelected_R_2))
                        Button("No") {
                            isSelected_R_2 = false
                            isSelected_R_2_No = true
                            answer.IPSWICHScore += 1
                            testRecord[1] = "yes"
                            
                        }
                        .buttonStyle(SelectedButtonStyle(isSelected: isSelected_R_2_No))
                    }.padding(10)
                        .padding(.leading, 10)
                    
                    Text("Spot 3: Left first toe") .padding(.leading, -145)
                        .padding(.bottom, -20)
                    HStack {
                        Button("Yes") {
                            isSelected_R_3 = true
                            isSelected_R_3_No = false
                            score_rf += 1
                            testRecord[2] = "yes"
                            
                        }
                        .buttonStyle(SelectedButtonStyle(isSelected: isSelected_R_3))
                        Button("No") {
                            isSelected_R_3 = false
                            isSelected_R_3_No = true
                            answer.IPSWICHScore += 1
                            testRecord[2] = "yes"
                            
                        }
                        .buttonStyle(SelectedButtonStyle(isSelected: isSelected_R_3_No))
                    }.padding(10)
                        .padding(.leading, 10)
                    
                    Text("Spot 4: Left fifth toe ") .padding(.leading, -145)
                        .padding(.bottom, -20)
                    HStack {
                        Button("Yes") {
                            isSelected_L_1 = true
                            isSelected_L_1_No = false
                            score_rf += 1
                            testRecord[3] = "yes"
                            
                            
                        }
                        .buttonStyle(SelectedButtonStyle(isSelected: isSelected_L_1))
                        Button("No") {
                            isSelected_L_1 = false
                            isSelected_L_1_No = true
                            answer.IPSWICHScore += 1
                            testRecord[3] = "yes"
                            
                            
                        }
                        .buttonStyle(SelectedButtonStyle(isSelected: isSelected_L_1_No))
                    }.padding(10)
                        .padding(.leading, 10)
                    
                    Text("Spot 5: Right third toe ") .padding(.leading, -140)
                        .padding(.bottom, -20)
                    HStack {
                        Button("Yes") {
                            isSelected_L_2 = true
                            isSelected_L_2_No = false
                            score_rf += 1
                            testRecord[4] = "yes"
                            
                        }
                        .buttonStyle(SelectedButtonStyle(isSelected: isSelected_L_2))
                        Button("No") {
                            isSelected_L_2 = false
                            isSelected_L_2_No = true
                            answer.IPSWICHScore += 1
                            testRecord[4] = "yes"
                            
                            
                        }
                        .buttonStyle(SelectedButtonStyle(isSelected: isSelected_L_2_No))
                    }.padding(10)
                        .padding(.leading, 10)
                    
                    Text("Spot 6: Left third toe") .padding(.leading, -140)
                        .padding(.bottom, -20)
                    HStack {
                        Button("Yes") {
                            isSelected_L_3 = true
                            isSelected_L_3_No = false
                            score_rf += 1
                            testRecord[5] = "yes"
                            
                            
                        }
                        .buttonStyle(SelectedButtonStyle(isSelected: isSelected_L_3))
                        Button("No") {
                            isSelected_L_3 = false
                            isSelected_L_3_No = true
                            answer.IPSWICHScore += 1
                            testRecord[5] = "yes"
                            
                            
                        }
                        .buttonStyle(SelectedButtonStyle(isSelected: isSelected_L_3_No))
                    }
                    .padding(10)
                    .padding(.leading, 10)
                }
                .padding()
                //save answer and link to next question
                Spacer().padding(7)
                    Text("Save Answer").onTapGesture {
                        // check all of the answers has fully answered
                        checkQuestionCompletion()
                    }
                    .simultaneousGesture(TapGesture().onEnded {
                        answer.answerRecord[17] =
                    """
                    Final Score:
                     \(score_rf)/6
                    """
                    })
                    Spacer()
                        .padding(20)
                
                .navigationTitle("IPSWICH Test")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            showMedicalInfo.toggle();
                        } label: {
                            Label("MediInfo", systemImage: "cross.circle.fill")
                        }
                    }
                    // Link to Pictorial resource in regards to Monofilament test
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            showMedicalInfo.toggle();
                        } label: {
                            Label("PictorialVideo", systemImage: "play.circle.fill")
                        }
                    }
                }
                .alert(isPresented: $showAlert, content: {
                    Alert(
                        title: Text("Incomplete Information"),
                        message: Text("Please fill in all fields."),
                        dismissButton: .default(Text("OK"))
                    )
                })
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
    func checkQuestionCompletion()
       {
          if (testRecord[0] != "yes" ||
               testRecord[1] != "yes" ||
               testRecord[2] != "yes" ||
               testRecord[3] != "yes" ||
               testRecord[4] != "yes" ||
               testRecord[5] != "yes")
           {
              showAlert = true
          }
           else{
               nextQuestion = true
           }
       }
}
