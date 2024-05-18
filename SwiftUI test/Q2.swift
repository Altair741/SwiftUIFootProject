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
        VStack{
            ZStack {
                VStack() {
                    Text("Does the patient have corns?")
                    ProgressBar2(progess: 2)
                    
                    HStack {
                        NavigationLink(destination: Q3()) {
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
                            answer.answerRecord[1] = "Yes"
                            
                        }
                        )
                        
                        NavigationLink(destination: Q3()) {
                            Text("No")
                                .padding()
                                .frame(width: 120, height: 50)
                                .background(isSelected2 ? Color.red : Color.gray)
                                .foregroundColor(.white)
                                .cornerRadius(25)
                        }
                        .simultaneousGesture(TapGesture().onEnded {
                            isSelected = false
                            isSelected2 = true
                            nextQuesion = true
                            answer.answerRecord[1] = "No"
                            
                        })
                    }// Hstack
                }// VStack
                
            }// ZStack
            .offset(y:-60)
            .navigationTitle("Skin Q.2")
            .padding()
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
