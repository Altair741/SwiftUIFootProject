import SwiftUI

struct Q5: View {
    @State private var isSelected = false
    @State private var isSelected2 = false
    @State private var medicalInfoScript = "Thickened nails can cause pressure under the skin leading to ulcers. Infections may occur and with thick toenails, patients may have a hard time cutting them. "
    private var task = "Thickened toenails"
    @State private var showMedicalInfo = false
    @EnvironmentObject var answer : UserAnswer
    @State private var nextQuesion = false


    
    var body: some View {
        VStack {
            ZStack {
                VStack(spacing : 30) {
                    ProgressBar2(progess: 17)

                    Image("thickened_toenails")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 240, height: 200)
                        .clipped()
                    Text("Does the patient have thickened toenails?")

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
            .navigationTitle("Thickened toenails")
            .padding()
            .offset(y:-60)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            showMedicalInfo.toggle();
                        } label: {
                            Label("MediInfo", systemImage: "cross.circle.fill")
                        }
                    }
            }
            .popover(isPresented: $showMedicalInfo) {
                VStack {
                   MedicalInfoPopUp(medicalInfoString: medicalInfoScript, task: task)
                }

            }
        }
    }
}
