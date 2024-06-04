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
        ZStack{
            Color.green.ignoresSafeArea()
            VStack{
                
                Image(systemName: "cross.circle.fill")
                    .foregroundColor(.white)
                    .font(.system(size: 100))
                    .padding()
                Text(task).font(.title).bold()
                    .padding()
                Text(medicalInfoString).font(.body)
                    .padding()
            }
        }
    }
}
