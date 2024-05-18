import SwiftUI

struct Q5: View {
    @State private var isSelected = false
    @State private var isSelected2 = false
    @State private var medicalInfoScript = "Thickened nails can cause pressure under the skin leading to ulcers. Infections may occur and with thick toenails, patients may have a hard time cutting them. "
    private var task = "Q5"
    @State private var showMedicalInfo = false
    @EnvironmentObject var answer : UserAnswer
    @State private var nextQuesion = false


    
    var body: some View {
        VStack {
            ZStack {
                VStack() {
                    Text("Does the patient have thickened toenails?")
                    ProgressBar2(progess: 5)

                    HStack {
                        NavigationLink(destination: Q6()) {
                            Text("Yes")
                                .padding()
                                .frame(width: 120, height: 50)
                                .background(isSelected ? Color.green : Color.gray)
                                .foregroundColor(.white)
                                .cornerRadius(25)
                        }
                        .simultaneousGesture(TapGesture().onEnded {
                            isSelected = true
                            isSelected2 = false
                            nextQuesion = true
                            answer.answerRecord[4] = "Yes"

                        }
                        )
                        
                        NavigationLink(destination: Q6()) {
                            Text("No")
                                .padding()
                                .frame(width: 120, height: 50)
                                .background(isSelected2 ? Color.red : Color.gray) // Change color based on isSelected2 state
                                .foregroundColor(.white)
                                .cornerRadius(25)
                        }
                        .simultaneousGesture(TapGesture().onEnded {
                            isSelected = false
                            isSelected2 = true
                            nextQuesion = true

                            answer.answerRecord[4] = "No"

                        })
                    }
                }
                
            }
            .padding()
            .offset(y:-60)
            .navigationTitle("Skint Q.5")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            showMedicalInfo.toggle();
                        } label: {
                            Label("MediInfo", systemImage: "cross.circle.fill")
                        }
                    }
            }
            .fullScreenCover(isPresented: $showMedicalInfo)
            {
                MedicalInfoPopUp(medicalInfoString: medicalInfoScript, task: task)
            }
        }
    }
}
