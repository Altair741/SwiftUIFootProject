//
//  MyModal.swift
//  ICT_footassessment
//
//  Created by 강민구 on 3/4/2024.
//

import SwiftUI

struct MyModal: View {
    @State private var showModal: Bool = true // Show the modal by default
    
    var body: some View {
        VStack {
            Spacer()
            
            // Show the modal
                .fullScreenCover(isPresented: $showModal) {
                    NavigationView {
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
                                
                                NavigationLink(destination: Monofilament_test()) {
                                    Text("PROCEED")
                                        .padding()
                                        .frame(width: 120, height: 50)
                                        .background(Color.green)
                                        .foregroundColor(.white)
                                        .cornerRadius(25)
                                    
                                    NavigationLink(destination: EndPage()) {
                                        Text("SKIP")
                                            .padding()
                                            .frame(width: 120, height: 50)
                                            .background(Color.green)
                                            .foregroundColor(.white)
                                            .cornerRadius(25)
                                    }
                                }
                            }
                        }
                    }
                }
        }
    }
}
