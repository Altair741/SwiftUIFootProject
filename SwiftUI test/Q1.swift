//
//  Q1.swift
//  ICT_footassessment
//
//  Created by 강민구 on 3/4/2024.
//

import SwiftUI

// reference : SelectedButtonStyle, Buttons
//Paul Hudson, How to make a NavigationStack return to its root view – Navigation SwiftUI Tutorial 5/9, video, YouTube, 20 August, viewed 3 April 2024, <https://www.youtube.com/watch?v=NkcVTEAl8eY>.
//
struct SelectedButtonStyle: ButtonStyle {
    var isSelected: Bool
    
    // function to define button's appearance and behaviors
    func makeBody(configuration: Configuration) -> some View {
        // label holds button's content view
        configuration.label
            .padding()
            .frame(width: 120, height: 50)
            .background(isSelected ? Color.green : Color.gray)
            .foregroundColor(.white) // text color
            .cornerRadius(25)
    }
}
// struct Name : View
struct Q1: View {
    @State private var isSelected = false
    @State private var isSelected2 = false
    @State private var medicalInfoScript = "Callus/Fissures are caused by cracks in the skin which go deep enough to cause bleeding. For patients diagnosed with diabetes, they may not be able to feel the pain causing further injuries and ulcers."
    @State private var showMedicalInfo = false
    // to use controll screen to be full
    @State private var nextQuestion = false
    // Record User answer, global varible
    @EnvironmentObject var answer : UserAnswer
    @State private var isQuestionListExpanded = false
    
    
    private var task = "Callus"
    
    //data
    
    var body: some View {
        Spacer().navigationBarBackButtonHidden(true)
        ZStack{
            VStack(spacing : 30) {
                ProgressBar2(progess: 1)
                
                Image("callus")
                    .resizable()
                    .scaledToFill() // set image to fully occupy the dimensions, if original image 500: 500, will make it to fit 260 200
                    .frame(width: 260, height: 200)
                    .clipped()// cut the image to align with the frame, shuld be called after resizalbe and scarledTofill
                
                Text("Does the patient have callus?")
                HStack {
                        Text("Yes")
                            .padding()
                            .frame(width: 120, height: 50)
                            .background(isSelected ? Color.green : Color.gray) // conditional back ground
                            .foregroundColor(.white) // test color
                            .cornerRadius(25)
                    .onTapGesture {
                        isSelected = true
                        isSelected2 = false
                        nextQuestion = true
                        answer.answerRecord[0] = "Yes"
                    }
                    .padding()
                                         
                        Text("No")
                            .padding()
                            .frame(width: 120, height: 50)
                            .background(isSelected2 ? Color.red : Color.gray)
                            .foregroundColor(.white)
                            .cornerRadius(25)
                    }
                    .onTapGesture(){
                        isSelected = false
                        isSelected2 = true
                        nextQuestion = true
                        answer.answerRecord[0] = "No"
                    }
                
//                Button {
//                    answer.answerRecord[0] = "Test"
//                } label: {
//                    Text("Test")
//                        .padding()
//                        .frame(width: 200 ,height: 50)
//                        .background(Color(.green)) // Button use background property to give its background Color
//                        .foregroundColor(.white)
//                        .cornerRadius(25)
//                }

                }
     
                
            }// end ZStack
            // good for relatively simple usage..
            .popover(isPresented: $showMedicalInfo) {
                VStack {
                    MedicalInfoPopUp(medicalInfoString: medicalInfoScript, task: task)
                }
            }
            // placement: .navigationBarTrailing : display at right coner
            // other options : left corner : navigationBarLeading
            // principal , middle or bottom
            // bottomBar , middle.
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showMedicalInfo.toggle()
                    } label: {
                        Label("MediInfo", systemImage: "cross.circle.fill")
                    }
                    
                }
            }.navigationTitle("Callus")
        }

    }
    

    
    struct Q1_Previews: PreviewProvider {
        static var previews: some View{
            Q1()
        }
    }

