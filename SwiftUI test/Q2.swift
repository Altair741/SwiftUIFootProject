import SwiftUI

struct Q2: View {
    
    
    @State private var isSelected = false
    @State private var isSelected2 = false
    @State private var medicalInfoScript = "As corns are caused by pressure, patients diagnosed with diabetes may not feel the sensation and this may lead to ulcers."
    private var task = "Q2"
    @State private var showMedicalInfo = false
    @EnvironmentObject var answer : UserAnswer
    @State private var nextQuesion = false

    
    var body: some View {
        Spacer()
        .navigationBarBackButtonHidden(true)
        Spacer()
        NavigationView {
            ZStack {
                VStack(spacing: 30) {
                    Text("Does the patient have corns?")
                    ProgressBar2(progess: 2)

                    HStack {
                        Button("Yes") {
                            isSelected = true
                            isSelected2 = false
                            nextQuesion = true
                            answer.answerRecord[3] = "Yes"
                        }
                        .buttonStyle(SelectedButtonStyle(isSelected: isSelected))
            
                        Button("No") {
                            isSelected2 = true
                            isSelected = false
                            nextQuesion = true
                            answer.answerRecord[1] = "No"
                        }
                        .buttonStyle(SelectedButtonStyle(isSelected: isSelected2))
                    }
                }
                .padding()
                //.navigationBarTitle("Q2", displayMode: .inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                            Button {
                                showMedicalInfo.toggle();
                            } label: {
                                Label("MediInfo", systemImage: "cross.circle.fill")
                            }
                        
                            NavigationLink(destination: Q1()){
                                Button {
                                    
                                } label: {
                                    Label("ContentView", systemImage: "arrow.left")
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
                    Q3()
                }

            }
        }
    }
}
