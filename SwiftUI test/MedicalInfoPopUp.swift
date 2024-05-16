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
                if task == "Q1"{
                    NavigationLink(destination: Q1().navigationBarBackButtonHidden(true)) {
                        Text("Back")
                            .frame(width: 120, height: 50)
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(25)
                    }.simultaneousGesture(TapGesture())

                    
                }else if task == "Q2"
                {
                    NavigationLink(destination: Q2().navigationBarBackButtonHidden(true)) {
                        Text("Back")
                            .frame(width: 120, height: 50)
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(25)
                    }.simultaneousGesture(TapGesture())

                }else if task == "Q3"
                {
                    NavigationLink(destination: Q3().navigationBarBackButtonHidden(true)) {
                        Text("Back")
                            .frame(width: 120, height: 50)
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(25)
                    }.simultaneousGesture(TapGesture())

                    
                }else if task == "Q4"
                {
                    NavigationLink(destination: Q4().navigationBarBackButtonHidden(true)) {
                        Text("Back")
                            .frame(width: 120, height: 50)
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(25)
                    }.simultaneousGesture(TapGesture())

                    
                }else if task == "Q5"
                {
                    NavigationLink(destination: Q5().navigationBarBackButtonHidden(true)) {
                        Text("Back")
                            .frame(width: 120, height: 50)
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(25)
                    }.simultaneousGesture(TapGesture())
                }else if task == "Q6"
                {NavigationLink(destination: Q6().navigationBarBackButtonHidden(true)) {
                    Text("Back")
                        .frame(width: 120, height: 50)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(25)
                }.simultaneousGesture(TapGesture())
                    
                }else if task == "Q7"
                {NavigationLink(destination: Q7().navigationBarBackButtonHidden(true)) {
                    Text("Back")
                        .frame(width: 120, height: 50)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(25)
                }.simultaneousGesture(TapGesture())
                    
                }else if task == "Q8"
                {NavigationLink(destination: Q8().navigationBarBackButtonHidden(true)) {
                    Text("Back")
                        .frame(width: 120, height: 50)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(25)
                }.simultaneousGesture(TapGesture())
                    
                }else if task == "Q9"
                {NavigationLink(destination: Q9().navigationBarBackButtonHidden(true)) {
                    Text("Back")
                        .frame(width: 120, height: 50)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(25)
                }.simultaneousGesture(TapGesture())
                }else if task == "Q10"
                {
                    NavigationLink(destination: Q10().navigationBarBackButtonHidden(true)) {
                        Text("Back")
                            .frame(width: 120, height: 50)
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(25)
                    }.simultaneousGesture(TapGesture())
                }
                else if task == "Q11"
                {
                    NavigationLink(destination: Q11().navigationBarBackButtonHidden(true)) {
                        Text("Back")
                            .frame(width: 120, height: 50)
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(25)
                    }.simultaneousGesture(TapGesture())
                    
                }else if task == "Q12"
                {
                    NavigationLink(destination: Q12().navigationBarBackButtonHidden(true)) {
                        Text("Back")
                            .frame(width: 120, height: 50)
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(25)
                    }.simultaneousGesture(TapGesture())
                }
                else if task == "DP_test"
                {
                    NavigationLink(destination: DP_test().navigationBarBackButtonHidden(true)) {
                        Text("Back")
                            .frame(width: 120, height: 50)
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(25)
                    }.simultaneousGesture(TapGesture())

                }
                else if task == "PT_test"
                {
                    NavigationLink(destination: PT_test().navigationBarBackButtonHidden(true)) {
                        Text("Back")
                            .frame(width: 120, height: 50)
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(25)
                    }.simultaneousGesture(TapGesture())

                }
//                else if task == "Monofilament_test"
//                {
//                    NavigationLink(destination: Monofilament_test().navigationBarBackButtonHidden(true)) {
//                        Text("Back")
//                            .frame(width: 120, height: 50)
//                            .background(Color.green)
//                            .foregroundColor(.white)
//                            .cornerRadius(25)
//                    }
//                    .simultaneousGesture(TapGesture())
                    

                
                
            }

        }
    }
}

