//
//  AlertPopup.swift
//  FootTest
//
//  Created by 강민구 on 27/5/2024.
//
// Ref : 
//
//
//

import SwiftUI

struct AlertPopup: View {
    @State private var isSelected = false
    @State var allquestionAnswered : Bool
    let title: String = "Please, Completed all qeustions"
    @State private var offset : CGFloat = 1000

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
                    Button{
                        close()
                    }label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundColor(.blue)
                            Text("Close")
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
            
        }
    }
}
