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
    @State private var showMedicalInfo = false
    @EnvironmentObject var answer: UserAnswer
    // score value to Right foot
    @State private var score_rf: Int = 0
    @State private var score_lf: Int = 0
    @State private var testRecord: [String] = Array(repeating: "", count: 6)
    @State private var showAlert = false
    @State private var moveToNext = false
    @Environment(\.dismiss) var dismiss

    var body: some View {
<<<<<<< HEAD
    
            ScrollView {
                VStack(spacing: 20) {
                    ProgressBar2(progess: 28)

                    Image("IPSWICH_touch_test_spot")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200, height: 200)
                        .clipped()
                    
                    Text("press the monofilament against the points indicated in the picture ")
                    
                    
                    Text("Spot 1: Right first toe")
                        .padding(.leading, -140)
                        .padding(.bottom, -20)
                    
                    HStack {
                        Button("Yes") {
                            isSelected_R_1 = true
                            isSelected_R_1_No = false
                            score_rf += 1
                            testRecord[0] = "yes"
=======
        VStack {
            ScrollView {
                VStack(spacing: 20) {
                    // Image and instructions
>>>>>>> 62bcea93dbd76ee237eee0c4f104844645db6b77

                    ForEach(0..<6) { index in
                        let spotLabel = "Spot \(index + 1): \(index < 3 ? "Right" : "Left") \((index % 3 == 0) ? "first" : (index % 3 == 1) ? "fifth" : "third") toe"

                        Text(spotLabel)
                            .padding(.leading, -140)
                            .padding(.bottom, -20)

                        HStack {
                            Button("Yes") {
                                testRecord[index] = "Yes"
                                if index < 3 {
                                    score_rf += 1
                                } else {
                                    score_lf += 1
                                }
                                switch index {
                                case 0:
                                    isSelected_R_1 = true
                                    isSelected_R_1_No = false
                                case 1:
                                    isSelected_R_2 = true
                                    isSelected_R_2_No = false
                                case 2:
                                    isSelected_R_3 = true
                                    isSelected_R_3_No = false
                                case 3:
                                    isSelected_L_1 = true
                                    isSelected_L_1_No = false
                                case 4:
                                    isSelected_L_2 = true
                                    isSelected_L_2_No = false
                                case 5:
                                    isSelected_L_3 = true
                                    isSelected_L_3_No = false
                                default:
                                    break
                                }
                            }
                            .buttonStyle(SelectedButtonStyle(isSelected: index < 3 ? [isSelected_R_1, isSelected_R_2, isSelected_R_3][index] : [isSelected_L_1, isSelected_L_2, isSelected_L_3][index - 3]))

                            Button("No") {
                                testRecord[index] = "No"
                                answer.IPSWICHScore += 1
                                switch index {
                                case 0:
                                    isSelected_R_1 = false
                                    isSelected_R_1_No = true
                                case 1:
                                    isSelected_R_2 = false
                                    isSelected_R_2_No = true
                                case 2:
                                    isSelected_R_3 = false
                                    isSelected_R_3_No = true
                                case 3:
                                    isSelected_L_1 = false
                                    isSelected_L_1_No = true
                                case 4:
                                    isSelected_L_2 = false
                                    isSelected_L_2_No = true
                                case 5:
                                    isSelected_L_3 = false
                                    isSelected_L_3_No = true
                                default:
                                    break
                                }
                            }
                            .buttonStyle(SelectedButtonStyle(isSelected: index < 3 ? [isSelected_R_1_No, isSelected_R_2_No, isSelected_R_3_No][index] : [isSelected_L_1_No, isSelected_L_2_No, isSelected_L_3_No][index - 3]))
                        }
                        .padding(10)
                        .padding(.leading, 10)
                    }
                }
                .padding()
            }
            .offset(y: -30)
            .navigationTitle("IPSWICH Test")
            // ... (toolbar and alert for medical info)

            Spacer()
            HStack {
                NavigationLink(destination: RiskCalculator()) {
                    Text("Save Answer")
                }
                .disabled(testRecord.contains("")) // Disable if any answers are not filled
                .onTapGesture {
                    if !testRecord.contains("") {
                        answer.answerRecord[17] =
                        """
                        Final Score:
                        \(score_rf)/6
                        """
                        
                        moveToNext = true
                    } else {
                        showAlert = true
                    }
                }
                
                Button("Back to Previous Page") {
                    dismiss() // Dismiss the view (go back to the previous screen)
                }
            }
<<<<<<< HEAD
            .offset(y:-30)
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
                    title: Text("Not completed!"),
                    message: Text("Please, enter the answer."),
                    dismissButton: .default(Text("OK"))
                )
            })
            .popover(isPresented: $showMedicalInfo) {
                VStack {
                   MedicalInfoPopUp(medicalInfoString: medicalInfoScript, task: task)
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
=======
            .padding(.bottom, 20)
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Incomplete Information"),
                message: Text("Please fill in all fields."),
                dismissButton: .default(Text("OK"))
            )
>>>>>>> 62bcea93dbd76ee237eee0c4f104844645db6b77
        }
    }
}


