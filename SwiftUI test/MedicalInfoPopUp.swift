//
//  MedicalInfoPopUp.swift
//  ICT_footassessment
//
//  Created by 강민구 on 30/4/2024.
//

import SwiftUI


struct MedicalInfoPopUp: View {
    
    var medicalInfoString : String
    var task : String
    
    var body: some View {
        NavigationView {
            VStack
            {
                Text(medicalInfoString)
                // Add conditional logic to navigate different view
                if task == "ContentView"{
                    NavigationLink(destination: ContentView()) {
                        Text("Back")
                            .frame(width: 120, height: 50)
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(25)
                    }.simultaneousGesture(TapGesture())
                }else if task == "Q2"
                {
                    NavigationLink(destination: Q2()) {
                        Text("Back")
                            .frame(width: 120, height: 50)
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(25)
                    }.simultaneousGesture(TapGesture())
                }else if task == "Q3"
                {
                    NavigationLink(destination: Q3()) {
                        Text("Back")
                            .frame(width: 120, height: 50)
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(25)
                    }.simultaneousGesture(TapGesture())
                    
                }else if task == "Q4"
                {
                    NavigationLink(destination: Q4()) {
                        Text("Back")
                            .frame(width: 120, height: 50)
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(25)
                    }.simultaneousGesture(TapGesture())
                    
                }else if task == "Q5"
                {
                    NavigationLink(destination: Q5()) {
                        Text("Back")
                            .frame(width: 120, height: 50)
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(25)
                    }.simultaneousGesture(TapGesture())
                }else if task == "Q6"
                {NavigationLink(destination: Q6()) {
                    Text("Back")
                        .frame(width: 120, height: 50)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(25)
                }.simultaneousGesture(TapGesture())
                    
                }else if task == "Q7"
                {NavigationLink(destination: Q7()) {
                    Text("Back")
                        .frame(width: 120, height: 50)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(25)
                }.simultaneousGesture(TapGesture())
                    
                }else if task == "Q8"
                {NavigationLink(destination: Q8()) {
                    Text("Back")
                        .frame(width: 120, height: 50)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(25)
                }.simultaneousGesture(TapGesture())
                    
                }else if task == "Q9"
                {NavigationLink(destination: Q9()) {
                    Text("Back")
                        .frame(width: 120, height: 50)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(25)
                }.simultaneousGesture(TapGesture())
                }else if task == "Q10"
                {
                    NavigationLink(destination: Q10()) {
                        Text("Back")
                            .frame(width: 120, height: 50)
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(25)
                    }.simultaneousGesture(TapGesture())
                }
                else if task == "Q11"
                {
                    NavigationLink(destination: Q11()) {
                        Text("Back")
                            .frame(width: 120, height: 50)
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(25)
                    }.simultaneousGesture(TapGesture())
                    
                }else if task == "Q12"
                {
                    NavigationLink(destination: Q12()) {
                        Text("Back")
                            .frame(width: 120, height: 50)
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(25)
                    }.simultaneousGesture(TapGesture())
                }
                
            }
        }
    }
}

