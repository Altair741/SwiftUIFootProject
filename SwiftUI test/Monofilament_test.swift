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
    @State private var showMedicalInfo = false
    @State private var showAlert = false
    @Environment(\.dismiss) var dismiss // To dismiss the view
    
    @EnvironmentObject var answer : UserAnswer

    @State private var score_rf: Int = 0
    @State private var score_lf: Int = 0

    @State private var testRecord: [String] = Array(repeating: "", count: 6)

    var body: some View {
        VStack {
            // ... (Image, Instructions, ProgressBar2)

            ScrollView {
                VStack(spacing: 20) {
                    ForEach(0..<6) { index in
                        let side = (index < 3) ? "Right" : "Left"
                        let location = (index % 3 == 0) ? "Big Toe" : (index % 3 == 1) ? "Ball of foot near big toe" : "Ball of foot near little toe"

                        Text("\(side) Foot - \(location)")
                            .padding(.leading, -100)

                        HStack {
                            Button("Yes") {
                                testRecord[index] = "Yes"
                                if index < 3 {
                                    score_rf += 1
                                } else {
                                    score_lf += 1
                                }
                                updateSelectionState(index: index, isSelected: true)
                            }
                            .buttonStyle(SelectedButtonStyle(isSelected: isSelectedFor(index: index, isYes: true)))

                            Button("No") {
                                testRecord[index] = "No"
                                answer.MonofilamentScore += 1
                                updateSelectionState(index: index, isSelected: false)
                            }
                            .buttonStyle(SelectedButtonStyle(isSelected: isSelectedFor(index: index, isYes: false)))
                        }
                        .padding()
                    }
                }
            }
            
            Spacer()
            
            Button("Save Answer") {
                if !testRecord.contains("") { // Check if all questions are answered
                    answer.answerRecord[16] = """
                    Final Score:
                    Right foot \(score_rf)/3
                    Left Foot \(score_lf)/3
                    """
                    dismiss() // Dismiss the view to go back
                } else {
                    showAlert = true
                }
            }
            .disabled(testRecord.contains(""))
            
            Spacer()
                .padding(20)
        }
        .offset(y: -40)
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Incomplete Information"),
                message: Text("Please fill in all fields."),
                dismissButton: .default(Text("OK"))
            )
        }
        .navigationTitle("Monofilament Test")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    showMedicalInfo.toggle()
                } label: {
                    Label("MediInfo", systemImage: "cross.circle.fill")
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    showMedicalInfo.toggle()
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

    private func updateSelectionState(index: Int, isSelected: Bool) {
        switch index {
        case 0: self.isSelected_R_1 = isSelected; self.isSelected_R_1_No = !isSelected
        case 1: self.isSelected_R_2 = isSelected; self.isSelected_R_2_No = !isSelected
        case 2: self.isSelected_R_3 = isSelected; self.isSelected_R_3_No = !isSelected
        case 3: self.isSelected_L_1 = isSelected; self.isSelected_L_1_No = !isSelected
        case 4: self.isSelected_L_2 = isSelected; self.isSelected_L_2_No = !isSelected
        case 5: self.isSelected_L_3 = isSelected; self.isSelected_L_3_No = !isSelected
        default: break
        }
    }
    
    private func isSelectedFor(index: Int, isYes: Bool) -> Bool {
        switch index {
        case 0: return isYes ? isSelected_R_1 : isSelected_R_1_No
        case 1: return isYes ? isSelected_R_2 : isSelected_R_2_No
        case 2: return isYes ? isSelected_R_3 : isSelected_R_3_No
        case 3: return isYes ? isSelected_L_1 : isSelected_L_1_No
        case 4: return isYes ? isSelected_L_2 : isSelected_L_2_No
        case 5: return isYes ? isSelected_L_3 : isSelected_L_3_No
        default: return false
        }
    }
}


