//
//  ContentView.swift
//  SwiftUI test
//
//  Created by Ethan Li on 5/5/2024.
//

import SwiftUI

struct ContentView: View {
<<<<<<< Updated upstream
  
        var body: some View {
            NavigationView { // Use NavigationView for navigation structure
                VStack(alignment: .center) {
=======
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
>>>>>>> Stashed changes
                    Text("Foot Test")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding()
                    //Start ASk section and IPWich test
<<<<<<< Updated upstream
                    NavigationLink(destination: Quizinerfaces()) {
                        Text("Start")
=======
                    
                    NavigationLink(destination: Navigation()) {
                        Text("Mono")
                            .font(.title)
>>>>>>> Stashed changes
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
<<<<<<< Updated upstream
                    }
                    //Start uer log in page
                    NavigationLink(destination: SignInView()) { // Use SignInView as the destination
                        Text("FirstSign In page")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }

                    /*
                    //Mingu : i'm gonna use this link to test my part of code!
                    NavigationLink(destination: Monofilament_test())
                    {
                        Text("Mingu Test")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                     */
=======
                            .frame(width: 200, height: 50)
                        
                        
                            .onTapGesture {
                                //Record time, when assessment task statr
                                answer.timeRecords.append(Date())
                            }.padding()
                            .navigationTitle("Ask section")
                        
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
>>>>>>> Stashed changes
                }
            }
        }
        
    }
<<<<<<< Updated upstream

struct ManualPage: View {
    var body: some View {
        Text("Manual Content Goes Here")
            .font(.title)
=======
    
    struct ManualPage: View {
        var body: some View {
            Text("Manual Content Goes Here")
                .font(.title)
        }
        
>>>>>>> Stashed changes
    }
}
