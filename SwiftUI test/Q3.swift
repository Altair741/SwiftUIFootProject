import SwiftUI
struct Q3: View {
    
    @State private var isSelected = false
    @State private var isSelected2 = false
    @State private var medicalInfoScript = "If tinea does not go away, after the initial treatment, the patient would need to be referred to a GP or podiatrist."
    private var task = "Q3"
    @State private var showMedicalInfo = false
    @State private var nextQuesion = false
    @EnvironmentObject var answer : UserAnswer
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack{
            ZStack {
                VStack() {
                    Text("Does the patient have tinea?")
                    ProgressBar2(progess: 3)
                    
                    HStack {
                        NavigationLink(destination: Q4()) {
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
                            answer.answerRecord[2] = "Yes"
                            
                        }
                        )
                        
                        NavigationLink(destination: Q4()) {
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
                            answer.answerRecord[2] = "No"
                            
                        })
                    }// H
                } // V
            } // Z
            .padding()
            .offset(y:-60)
            .navigationTitle("Skin Q.3")
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
