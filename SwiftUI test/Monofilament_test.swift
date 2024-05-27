import SwiftUI

struct Monofilament_test: View {
    
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
    
    @State private var medicalInfoScript = "Contact time should be approximately 2 seconds and if the answer is no, do not try again, If the patient can’t feel the monofilament at one or more of the sites, they would need further checks."
    private var task = "Monofilament_test"
    @State private var showMedicalInfo = false
    @State private var nextQuestion = false
    @State private var showAlert = false

    @EnvironmentObject var answer : UserAnswer
    // score value to Right foot
    @State private var score_rf: Int = 0
    @State private var score_lf: Int = 0
    
    @State private var testRecord: [String] = Array(repeating: "Not Answered", count: 6)
    
    // 16 user answer.
    
    var body: some View {
        VStack{
            ScrollView {
                VStack(spacing: 20) {
                    
                    Image("Monofilament_test_spot")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200, height: 200)
                        .clipped()
                    
                    Text("press the monofilament against the points indicated in the picture ")
                    
                    ProgressBar2(progess: 16)
                    
                    Text("Right foot").padding(10).font(.title)
                    Text("Spot 1: Big Toe").padding(.leading, -140).padding(-30).padding()
                    HStack {
                        Button("Yes") {
                            isSelected_R_1 = true
                            isSelected_R_1_No = false
                            score_rf += 1
                            // record if it's answered for each spot
                            testRecord[0] = "yes"
                            
                        }
                        .buttonStyle(SelectedButtonStyle(isSelected: isSelected_R_1))
                        Button("No") {
                            isSelected_R_1 = false
                            isSelected_R_1_No = true
                            answer.MonofilamentScore += 1
                            testRecord[0] = "yes"

                        }
                        .buttonStyle(SelectedButtonStyle(isSelected: isSelected_R_1_No))
                    }.padding(-30)
                        .padding(.leading, 10)
                    
                    Text("Spot 2: Ball of foot near big toe ").padding(.leading, -100).padding()
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
                            answer.MonofilamentScore += 1
                            testRecord[1] = "yes"

                        }
                        .buttonStyle(SelectedButtonStyle(isSelected: isSelected_R_2_No))
                    }.padding(-20)
                        .padding(.leading, 10)
                    
                    Text("Spot 3: Ball of foot near little toe ").padding(.leading, -90).padding()
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
                            answer.MonofilamentScore += 1
                            testRecord[2] = "yes"

                        }
                        .buttonStyle(SelectedButtonStyle(isSelected: isSelected_R_3_No))
                    }.padding(-20)
                        .padding(.leading, 10)
                    
                    
                    
                    // left foot
                    Text("Left foot").padding(10).font(.title)
                    Text("Spot 1: Big Toe").padding(.leading, -140).padding(-30).padding()
                    HStack {
                        Button("Yes") {
                            isSelected_L_1 = true
                            isSelected_L_1_No = false
                            score_lf += 1
                            testRecord[3] = "yes"

                            
                        }
                        .buttonStyle(SelectedButtonStyle(isSelected: isSelected_L_1))
                        Button("No") {
                            isSelected_L_1 = false
                            isSelected_L_1_No = true
                            answer.MonofilamentScore += 1
                            testRecord[3] = "yes"

                            
                        }
                        .buttonStyle(SelectedButtonStyle(isSelected: isSelected_L_1_No))
                    }.padding(-30)
                        .padding(.leading, 10)
                    
                    Text("Spot 2: Ball of foot near big toe ").padding(.leading, -100).padding()
                    HStack {
                        Button("Yes") {
                            isSelected_L_2 = true
                            isSelected_L_2_No = false
                            score_lf += 1
                            testRecord[4] = "yes"

                        }
                        .buttonStyle(SelectedButtonStyle(isSelected: isSelected_L_2))
                        Button("No") {
                            isSelected_L_2 = false
                            isSelected_L_2_No = true
                            answer.MonofilamentScore += 1
                            testRecord[4] = "yes"

                            
                        }
                        .buttonStyle(SelectedButtonStyle(isSelected: isSelected_L_2_No))
                    }.padding(-20)
                        .padding(.leading, 10)
                    
                    Text("Spot 3: Ball of foot near little toe ").padding(.leading, -90).padding()
                    HStack {
                        Button("Yes") {
                            isSelected_L_3 = true
                            isSelected_L_3_No = false
                            score_lf += 1
                            testRecord[5] = "yes"

                            
                        }
                        .buttonStyle(SelectedButtonStyle(isSelected: isSelected_L_3))
                        Button("No") {
                            isSelected_L_3 = false
                            isSelected_L_3_No = true
                            answer.MonofilamentScore += 1
                            testRecord[5] = "yes"

                            
                        }
                        .buttonStyle(SelectedButtonStyle(isSelected: isSelected_L_3_No))
                    }
                    .padding(-20)
                    .padding(.leading, 10)
                }
                .padding()
                //save answer and link to next question
                Spacer().padding(7)
                NavigationLink(destination: IPSWICH_test(), isActive: $nextQuestion){
                    Text("Save Answer").onTapGesture {
                        // check all of the answers has fully answered
                        checkQuestionCompletion()
                    }
                }
                .simultaneousGesture(TapGesture().onEnded {
                    // Record time, when assessment task is done
                    answer.answerRecord[16] =
                    """
                    Final Score:
                    Right foot \(score_rf)/3
                    Left Foot \(score_rf)/3
                    """
                })
                Spacer()
                    .padding(20)
            }
            .offset(y:-40)
            .alert(isPresented: $showAlert, content: {
                Alert(
                    title: Text("Incomplete Information"),
                    message: Text("Please fill in all fields."),
                    dismissButton: .default(Text("OK"))
                )
            })
            .navigationTitle("Monofilament Test")
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
