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
                    Text("Does/did the patient have an corns?")
                    ProgressBar(progess: 2)

                    HStack {
                        NavigationLink(destination: MyModal()) {
                            Text("Yes")
                                .padding()
                                .frame(width: 120, height: 50)
                                .background(isSelected ? Color.green : Color.gray) // Change color based on isSelected state
                                .foregroundColor(.white)
                                .cornerRadius(25)
                        }
                        .simultaneousGesture(TapGesture().onEnded {
                            isSelected = true
                            isSelected2 = false
                            answer.answerRecord[1] = "Yes"
                        }
                        )
                        NavigationLink(destination: Q3()) {
                            Text("No")
                                .padding()
                                .frame(width: 120, height: 50)
                                .background(isSelected2 ? Color.red : Color.gray) // Change color based on isSelected2 state
                                .foregroundColor(.white)
                                .cornerRadius(25)
                        }
                        .simultaneousGesture(TapGesture().onEnded {
                            isSelected2 = true
                            isSelected = false
                            nextQuesion = true
                            answer.answerRecord[1] = "No"

                            
                        })
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
                        
                        }
//                    ToolbarItem(placement: .navigationBarLeading) {
//                        NavigationLink(destination: ContentView()){
//                            Button {
//                                
//                            } label: {
//                                Label("ContentView", systemImage: "arrow.left")
//                            }
//                            
//                        }
//                    }
                    
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
