//
//  MyModal.swift
//  ICT_footassessment
//
//  Created by 강민구 on 3/4/2024.
//

import SwiftUI

struct MyModal: View {
    @State private var showModal: Bool = true // Show the modal by default
    @EnvironmentObject var answer : UserAnswer
    @State private var isSelected = false
    @State private var isSelected2 = false
    @State private var moveToTouchTest = false
    @State private var moveToMonoTest = false
    
    
    var body: some View {
        VStack {
            Spacer()
            // Show the modal
                .fullScreenCover(isPresented: $showModal) {
                        ZStack {
                            Color.yellow.ignoresSafeArea()
                            VStack {
                                Image(systemName: "exclamationmark.triangle")
                                    .foregroundColor(.red)
                                    .font(.system(size: 100))
                                    .padding(.top)
                                
                                Text("This test requires a monofilament, if you do not have one press skip and move onto the Ipswich Touch Test")
                                    .padding(.top, 30)
                                    .padding(.bottom, 20)
                                
                                HStack {
                                    Button("PROCEED") {
                                        isSelected = true
                                        isSelected2 = false
                                        moveToMonoTest = true
                                    }
                                    .buttonStyle(SelectedButtonStyle(isSelected: isSelected))
                                    
                                    Button("SKIP") {
                                        isSelected2 = true
                                        isSelected = false
                                        moveToTouchTest = true
                                        answer.answerRecord[16] = "Test has been skipped"
                                    }
                                    .buttonStyle(SelectedButtonStyle(isSelected: isSelected2))
                                    
                                }
                            }
                            .fullScreenCover(isPresented: $moveToTouchTest)
                            {
                                // should be modified to touch test
                                EndPage()
                            }
                            .fullScreenCover(isPresented: $moveToMonoTest)
                            {
//                                Monofilament_test()
                            }
                        }
                }
        }//Vstack
        
    }
}
