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
    private var task = "Monofilament_test"
    @State private var showMedicalInfo = false
    @State private var nextQuesion = false
    @EnvironmentObject var answer : UserAnswer
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 30) {
                    Text("Monofilament Test").fontWeight(.semibold)
                        .font(.title)
                    
                    Image("Monofilament_test_spot")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200, height: 200)
                        .clipped()
                    
                    Text("press the monofilament against the points indicated in the picture ")
                    
                    ProgressBar(progess: 16)
                    
                    Text("Right foot").padding(10).font(.title)
                    Text("Spot 1: Big Toe").padding(.leading, -140).padding(-30)
                    HStack {
                        Button("Yes") {
                            isSelected_R_1 = true
                            isSelected_R_1_No = false
                        }
                        .buttonStyle(SelectedButtonStyle(isSelected: isSelected_R_1))
                        Button("No") {
                            isSelected_R_1 = false
                            isSelected_R_1_No = true
                        }
                        .buttonStyle(SelectedButtonStyle(isSelected: isSelected_R_1_No))
                    }.padding(-30)
                        .padding(.leading, 10)
                    
                    Text("Spot 2: Ball of foot near big toe ").padding(.leading, -100)
                    HStack {
                        Button("Yes") {
                            isSelected_R_2 = true
                            isSelected_R_2_No = false
                        }
                        .buttonStyle(SelectedButtonStyle(isSelected: isSelected_R_2))
                        Button("No") {
                            isSelected_R_2 = false
                            isSelected_R_2_No = true

                        }
                        .buttonStyle(SelectedButtonStyle(isSelected: isSelected_R_2_No))
                    }.padding(-20)
                        .padding(.leading, 10)
                    
                    Text("Spot 3: Ball of foot near little toe ").padding(.leading, -90)
                    HStack {
                        Button("Yes") {
                            isSelected_R_3 = true
                            isSelected_R_3_No = false

                        }
                        .buttonStyle(SelectedButtonStyle(isSelected: isSelected_R_3))
                        Button("No") {
                            isSelected_R_3 = false
                            isSelected_R_2_No = true

                        }
                        .buttonStyle(SelectedButtonStyle(isSelected: isSelected_R_3_No))
                    }.padding(-20)
                        .padding(.leading, 10)
                    
                    
                    
                    // left foot
                    Text("Left foot").padding(10).font(.title)
                    Text("Spot 1: Big Toe").padding(.leading, -140).padding(-30)
                    HStack {
                        Button("Yes") {
                            isSelected_L_1 = true
                            isSelected_L_1_No = false
                        }
                        .buttonStyle(SelectedButtonStyle(isSelected: isSelected_L_1))
                        Button("No") {
                            isSelected_L_1 = false
                            isSelected_L_1_No = true
                        }
                        .buttonStyle(SelectedButtonStyle(isSelected: isSelected_L_1_No))
                    }.padding(-30)
                        .padding(.leading, 10)
                    
                    Text("Spot 2: Ball of foot near big toe ").padding(.leading, -100)
                    HStack {
                        Button("Yes") {
                            isSelected_L_2 = true
                            isSelected_L_2_No = false
                        }
                        .buttonStyle(SelectedButtonStyle(isSelected: isSelected_L_2))
                        Button("No") {
                            isSelected_L_2 = false
                            isSelected_L_2_No = true
                        }
                        .buttonStyle(SelectedButtonStyle(isSelected: isSelected_L_2_No))
                    }.padding(-20)
                        .padding(.leading, 10)
                    
                    Text("Spot 3: Ball of foot near little toe ").padding(.leading, -90)
                    HStack {
                        Button("Yes") {
                            isSelected_L_3 = true
                            isSelected_L_3_No = false
                        }
                        .buttonStyle(SelectedButtonStyle(isSelected: isSelected_L_3))
                        Button("No") {
                            isSelected_L_3 = false
                            isSelected_L_3_No = true
                        }
                        .buttonStyle(SelectedButtonStyle(isSelected: isSelected_L_3_No))
                    }.padding(-20)
                        .padding(.leading, 10)
            
                }
                .padding()
                // Button to save answer and link to next question
                Button("Save Anwser"){
                    nextQuesion = true
                }.padding(10)
            }
            
            
            .navigationBarBackButtonHidden(true)
            
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            showMedicalInfo.toggle();
                        } label: {
                            Label("MediInfo", systemImage: "info.circle")
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
                ToolbarItem(placement: .navigationBarLeading) {
                    NavigationLink(destination: PT_test()){
                        Button {
                            
                        } label: {
                            Label("", systemImage: "arrow.left")
                        }
                    }
                }
            }
            .navigationBarBackButtonHidden(true)

            .fullScreenCover(isPresented: $showMedicalInfo)
            {
                MedicalInfoPopUp(medicalInfoString: medicalInfoScript, task: task)
            }
            
        }
    }
}

#Preview {
    Monofilament_test()
}