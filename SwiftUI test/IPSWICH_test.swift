import SwiftUI

struct IPSWICH_test: View {
    @State private var isSelected_R_1 = false
    @State private var isSelected_R_2 = false
    @State private var isSelected_R_3 = false
    @State private var isSelected_L_1 = false
    @State private var isSelected_L_2 = false
    @State private var isSelected_L_3 = false

    @State private var medicalInfoScript = "Lightly touch the indicated parts of the foot and hold for 1 to 2 seconds. Do not press, poke, tap, or stroke. If the response is no, do not try again or press harder. The toes must be touched in the following order."
    private var task = "IPSWICH_touch_test"
    @State private var showMedicalInfo = false

    // Score
    @State private var rightFootScore: Int = 0

    @EnvironmentObject var answer: UserAnswer

    var body: some View {
        VStack {
            ScrollView {
                VStack(spacing: 20) {
                    Image("IPSWICH_touch_test_spot")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200, height: 200)
                        .clipped()
                    
                    Text("Press the monofilament against the points indicated in the picture.")
                    
                    ProgressBar2(progess: 16) // Assuming ProgressBar2 is a custom view

                    ForEach(["Right first toe", "Right fifth toe", "Right third toe", "Left first toe", "Left fifth toe", "Left third toe"], id: \.self) { toe in
                        Text("Spot \(toe)")
                            .padding(.leading, -140)
                            .padding(.bottom, -20)

                        HStack {
                            Button("Yes") {
                                // Update score for YES answers (if needed)
                                if toe.hasPrefix("Right") {
                                    rightFootScore += 1
                                }
                                // Reset 'No' button if previously selected
                                if let binding = getBinding(for: toe, isYes: false) {
                                    binding.wrappedValue = false
                                }
                            }
                            .buttonStyle(SelectedButtonStyle(isSelected: getBinding(for: toe, isYes: true)?.wrappedValue ?? false)) // Use appropriate binding

                            Button("No") {
                                answer.IPSWICHScore += 1
                                // Reset 'Yes' button if previously selected
                                if let binding = getBinding(for: toe, isYes: true) {
                                    binding.wrappedValue = false
                                }
                            }
                            .buttonStyle(SelectedButtonStyle(isSelected: getBinding(for: toe, isYes: false)?.wrappedValue ?? false)) // Use appropriate binding
                        }
                        .padding(10)
                        .padding(.leading, 10)
                    }
                } // End VStack
                .padding()
            } // End ScrollView

            NavigationLink(destination: RiskCalculator()) {
                Text("Save Answer")
            }
            .simultaneousGesture(TapGesture().onEnded {
                answer.answerRecord[17] = """
                Final Score:
                  \(rightFootScore)/6
                """
            })
            .padding(.bottom, 20)

        } // End main VStack
        .navigationTitle("IPSWICH Test")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: { showMedicalInfo.toggle() }) {
                    Label("MediInfo", systemImage: "info.circle")
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
    } // End body

    // Helper function to get binding based on toe and Yes/No
    private func getBinding(for toe: String, isYes: Bool) -> Binding<Bool>? {
        switch (toe, isYes) {
        case ("Right first toe", true): return $isSelected_R_1
        case ("Right first toe", false): return nil // No binding for 'No' buttons
        case ("Right fifth toe", true): return $isSelected_R_2
        case ("Right fifth toe", false): return nil
        case ("Right third toe", true): return $isSelected_R_3
        case ("Right third toe", false): return nil
        case ("Left first toe", true): return $isSelected_L_1
        case ("Left first toe", false): return nil
        case ("Left fifth toe", true): return $isSelected_L_2
        case ("Left fifth toe", false): return nil
        case ("Left third toe", true): return $isSelected_L_3
        case ("Left third toe", false): return nil
        default: return nil
        }
    }

}
