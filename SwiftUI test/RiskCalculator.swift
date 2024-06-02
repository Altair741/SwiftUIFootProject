//
//  RiskCalculator.swift
//  FootTest
//
//  Created by 강민구 on 19/5/2024.
//

import SwiftUI

struct RiskCalculator: View {
    
    @EnvironmentObject var answer: UserAnswer
    @State private var isPAD = false
    @State private var isLOPS = false
    @State private var isDeformity = false
    @State private var isUlcer = false
    @State private var isAmputations = false
    @State private var isSelected = false
    @State private var isSelected2 = false
    @State private var isSelected3 = false
    @State private var finishTest = true
    @State private var showAlert = false
    @State private var startAgain = false
    
    var body: some View {
        ZStack{
           
            
            VStack {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(.green)
                    .font(.system(size: 100))
                    .padding(.top)
                
                Text("The assessemnt took \(Int(answer.assessmentTime)) seconds").bold().font(.system(size: 20))
                    .padding(.top)
                Text("Assessment result")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .padding(.top, 10)
                
                switch answer.system_g_risk {
                    
                case "VERY LOW":
                    Text("Very Low")
                        .padding()
                        .frame(width: 200, height: 50)
                        .background( Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                case "LOW":
                    Text("Low")
                        .padding()
                        .frame(width: 200, height: 50)
                        .background( Color.yellow)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                default:
                    Text("Moderate or High")
                        .padding()
                        .frame(width: 200, height: 50)
                        .background( Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
                Text("Pick one")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .padding(.top, 10)
                
                VStack {
                    NavigationLink(destination: SignInView().navigationBarBackButtonHidden()) {
                        Text("Very Low")
                            .padding()
                            .frame(width: 200, height: 50)
                            .background(isSelected ? Color.green : Color.gray)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .simultaneousGesture(TapGesture().onEnded {
                        isSelected = true
                        isSelected2 = false
                        isSelected3 = false
                        answer.user_s_risk = "Very Low"
                        
                    })
                    
                    NavigationLink(destination: SignInView().navigationBarBackButtonHidden()) {
                        Text("Low")
                            .padding()
                            .frame(width: 200, height: 50)
                            .background(isSelected2 ? Color.yellow : Color.gray)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .simultaneousGesture(TapGesture().onEnded {
                        isSelected = false
                        isSelected2 = true
                        isSelected3 = false
                        answer.user_s_risk = "Low"
                    })
                    NavigationLink(destination: SignInView().navigationBarBackButtonHidden()) {
                        Text("Modearate or High")
                            .padding()
                            .frame(width: 200, height: 50)
                            .background(isSelected3 ? Color.red : Color.gray)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .simultaneousGesture(TapGesture().onEnded {
                        isSelected = false
                        isSelected2 = false
                        isSelected3 = true
                        answer.user_s_risk = "Modearate or High"
                    })
                    
                }
                
//                NavigationLink(
//                    destination: ContentView().navigationBarBackButtonHidden(true)
//                        .navigationBarHidden(true),
//                    isActive: $startAgain,
//                    label: { EmptyView() }
//                )
            }
        }
        .onAppear {
            riskCalculate()
            getRisk()
            getAssessmentTime()
            checkAlert()
        }
        .navigationTitle("Risk Assessment")
        .alert(isPresented: $showAlert)
        {
            Alert(
                title: Text("Not completed"),
                message: Text("remained task detected!").font(.title3),
                dismissButton: .default(Text("Ok"))
            )
        }
    }
    
    
    func riskCalculate ()
    {
        //PAD
        //        answer.assessmentRecord[1] = "yes"
        //        //PAD2
        //        answer.assessmentRecord[2] = "yes"
        
        //        // deformity
        //        answer.answerRecord[0] = "yes"
        //        // ulcer
        //        answer.answerRecord[3] = "yes"
        //        // LOPS
        //        answer.assessmentRecord[3] = "yes"
        //        // LOPS2
        //        answer.assessmentRecord[3] = "yes"
        
        
        if answer.assessmentRecord[1] == "yes"
        {
            isPAD = true
        }
        if answer.assessmentRecord[2] == "yes"
        {
            isPAD = true
        }
        if answer.assessmentRecord[3] == "yes"
        {
            isLOPS = true
        }
        if answer.assessmentRecord[4] == "yes"
        {
            isLOPS = true
        }
        if answer.assessmentRecord[5] == "yes"
        {
            isLOPS = true
        }
        if answer.assessmentRecord[6] == "yes"
        {
            isLOPS = true
        }
        if answer.assessmentRecord[10] == "yes"
        {
            isPAD = true
        }
        // Ask section End
        if answer.answerRecord[0] == "yes"
        {
            isDeformity = true
        }
        if answer.answerRecord[1] == "yes"
        {
            isDeformity = true
            
        }
        if answer.answerRecord[2] == "yes"
        {
            isDeformity = true
            
        }
        if answer.answerRecord[3] == "yes"
        {
            isDeformity = true
            isUlcer = true
        }
        if answer.answerRecord[4] == "yes"
        {
            isDeformity = true
            
        }
        if answer.answerRecord[5] == "yes"
        {
            isDeformity = true
            
        }
        if answer.answerRecord[6] == "yes"
        {
            isDeformity = true
            
        }
        if answer.answerRecord[7] == "yes"
        {
            isDeformity = true
            
        }
        if answer.answerRecord[8] == "yes"
        {
            isDeformity = true
            
        }
        if answer.answerRecord[9] == "yes"
        {
            isDeformity = true
            
        }
        if answer.answerRecord[10] == "yes"
        {
            isAmputations = true
        }
        // Skin section End
        if answer.answerRecord[12] == "No" || answer.answerRecord[13] == "No"
        {
            isPAD = true
        }
        if answer.answerRecord[14] == "No" || answer.answerRecord[15] == "No"
        {
            isPAD = true
        }
        if answer.MonofilamentScore > 0
        {
            isLOPS = true
        }
        if answer.IPSWICHScore > 1
        {
            isLOPS = true
        }
    }
    func getRisk() {
        print("result")
        print(isPAD)
        print(isLOPS)
        print(isUlcer)
        print(isAmputations)
        print(isDeformity)
        // contain none
        if isPAD == false &&
            isLOPS == false &&
            isDeformity == false &&
            isUlcer == false &&
            isAmputations == false
        {
            answer.system_g_risk = "VERY LOW"
            
        }
        else if
            isPAD == false &&
                isLOPS == true &&
                isDeformity == false &&
                isUlcer == false &&
                isAmputations == false
        {
            answer.system_g_risk = "Moderate or High"
        }
        else if
            isPAD == true &&
                isLOPS == false &&
                isDeformity == false &&
                isUlcer == false &&
                isAmputations == false
        {
            answer.system_g_risk = "LOW"
        }
        
        
        else {
            answer.system_g_risk = "Moderate or High"
        }
        
    }
    func getAssessmentTime()
    {
        if finishTest{
            let startTime = answer.timeRecords[0]
            let endTime = Date()
            
            let assessmentTime = endTime.timeIntervalSince(startTime)
            answer.assessmentTime = assessmentTime
        }
    }
    func checkAlert()
    {
        if (!answer.checkCompletion()){
            showAlert.toggle()
        }
        print(showAlert)
    }
}


