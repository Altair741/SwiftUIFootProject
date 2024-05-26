//
//  AlertPopup.swift
//  FootTest
//
//  Created by 강민구 on 27/5/2024.
//

import SwiftUI

struct AlertPopup: View {
    @State private var isSelected = false
    @Binding var allquestionAnswered : Bool
    let title: String = "Complete all qeustions?"
    let message : String = "There are questions not anwsered yet!"
    let action: () -> ()
    @State private var offset : CGFloat = 1000
    @Binding var startAain: Bool

    var body: some View {
        
        if !allquestionAnswered {
            ZStack{
                // when click background the popup display disapeal
                Color(.black)
                    .onTapGesture {
                        close()
                    }
                    .opacity(0.7)
                VStack{
                    Text(title)
                        .font(.title2)
                        .bold()
                        .padding()
                    
                    Text(message)
                        .font(.body)
                    
                    Button{
                        close()
                    }label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundColor(.blue)
                            Text("Do Again")
                                .font(.system(size: 16))
                                .bold()
                                .foregroundColor(.white)
                            
                        }
                        .frame(width: 120, height: 50)
                        .padding()
                    }}
                .padding()
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .padding(30)
                .offset(x: 0, y: offset)
                .onAppear{
                    withAnimation(.spring()){
                        offset = 0
                    }
                }
            }
        }
    }
    func close()
    {
        withAnimation(.spring()){
            allquestionAnswered = true
            offset = 1000
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            startAain = true
                        }
        }
    }
}
