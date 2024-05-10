import SwiftUI
struct Q3: View {
    
    @State private var isSelected = false
    @State private var isSelected2 = false
    @State private var isSelected3 = false
    @State private var isSelected4 = false
    @State private var navigateToQ2 = false
    @State private var medicalInfoScript = "If tinea does not go away, after the initial treatment, the patient would need to be referred to a GP or podiatrist."
    private var task = "Q3"
    @State private var showMedicalInfo = false
    @State private var nextQuesion = false
    @EnvironmentObject var answer : UserAnswer

    
    var body: some View {
        Spacer()
        .navigationBarBackButtonHidden(true)
        Spacer()
        NavigationView {
            
            VStack(spacing: 30) {
                Text("Does/did the patient have tinea?")
                ProgressBar(progess: 3)

                HStack {
                    Button("Dry") {
                        isSelected = true
                        isSelected2 = false
                        isSelected3 = false
                        isSelected4 = false
                        navigateToQ2 = true
                        nextQuesion = true
                        answer.answerRecord[2] = "Dry"
                    }
                    .buttonStyle(SelectedButtonStyle(isSelected: isSelected))
                    
                    Button("Normal") {
                        isSelected2 = true
                        isSelected = false
                        isSelected3 = false
                        isSelected4 = false
                        navigateToQ2 = true
                        nextQuesion = true
                        answer.answerRecord[2] = "Normal"

                    }
                    .buttonStyle(SelectedButtonStyle(isSelected: isSelected2))
                }
                .padding(.leading, 10)


                HStack {
                    Button("Sweaty") {
                        isSelected3 = true
                        isSelected = false
                        isSelected2 = false
                        isSelected4 = false
                        navigateToQ2 = true
                        answer.answerRecord[2] = "Sweaty"
                    }
                    .buttonStyle(SelectedButtonStyle(isSelected: isSelected3))
                    
                    Button("Shiney") {
                        isSelected4 = true
                        isSelected = false
                        isSelected2 = false
                        isSelected3 = false
                        navigateToQ2 = true
                        answer.answerRecord[2] = "Shiney"

                    }
                    .buttonStyle(SelectedButtonStyle(isSelected: isSelected4))
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
                        NavigationLink(destination: Q2()){
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
                    Q4()
                }
            }
        }
    }
}

struct SelectedButtonStyle: ButtonStyle {
    var isSelected: Bool
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .frame(width: 120, height: 50)
            .background(isSelected ? Color.green : Color.gray)
            .foregroundColor(.white)
            .cornerRadius(25)
    }
}
