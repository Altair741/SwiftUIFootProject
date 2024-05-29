//
//  ContentView.swift
//  SwiftUI test
//
//  Created by Ethan Li on 5/5/2024.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var answer : UserAnswer
    @Environment(\.dismiss) private var dismiss
    @State private var showExitAlert = false
    //    @State private var showExit
    
    var body: some View {
        
        NavigationView { // Use NavigationView for navigation structure
            
            ZStack{
                Image("backGround_main")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .opacity(0.7)
                VStack() {
                    
                    
                    Text("Foot Test")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding()
                    //Start ASk section and IPWich test
                    NavigationLink(destination: Quizinerfaces()) {
                        Text("Start")
                            .font(.title)
                            .padding()
                            .background(Color.red)
                            .foregroundColor(.white)
                            .bold()
                            .cornerRadius(10)
                            .frame(width: 200, height: 50)
                    }
                    .onTapGesture {
                        //Record time, when assessment task statr
                        answer.timeRecords.append(Date())
                    }.padding()
                        .navigationTitle("Ask section")
 
//                    Button("Exit App")
//                    
//                    {
//                        showExitAlert = true
//                    }
//                    .font(.title)
//                    .padding()
//                    .background(Color.red)
//                    .foregroundColor(.white)
//                    .bold()
//                    .cornerRadius(10)
//                    .frame(width: 200, height: 50)
//                    .alert(isPresented: $showExitAlert){
//                        Alert(title:
//                                Text("Exit App"),
//                              message: Text("Are you sure?"),
//                              primaryButton: .destructive(Text("Exit")){
//                            dismiss()
//                        },
//                              secondaryButton: . cancel()
//                        )
//                    }
//                    
                    //Start uer log in page
                    //                    NavigationLink(destination: SignInView()) {
                    //                        Text("FirstSign In page")
                    //                            .padding()
                    //                            .background(Color.blue)
                    //                            .foregroundColor(.white)
                    //                            .cornerRadius(10)
                    //                    }
                    //Mingu : i'm gonna use this link to test my part of code!
                    //                    NavigationLink(destination:  MedicalInfoPopUp(medicalInfoString: "this is medical string", task: "Q8"))
                    //                    {
                    //                        Text("Mingu Test")
                    //                            .padding()
                    //                            .background(Color.blue)
                    //                            .foregroundColor(.white)
                    //                            .cornerRadius(10)
                    //                    }
                }
                .navigationTitle("") // Hide default title
                .navigationBarHidden(true) // Hide navigation bar
            }
        }
    }
    
}

struct ManualPage: View {
    var body: some View {
        Text("Manual Content Goes Here")
            .font(.title)
    }
    
}
