//
//  UserAnswer.swift
//  ICT_footassessment
//
//  Created by 강민구 on 5/5/2024.
//

import Foundation
import Combine

class UserAnswer : ObservableObject
{
    @Published var userDetails: [String] = Array(repeating: "Not given", count: 4)
    @Published var answerRecord: [String] = Array(repeating: "Not Answered", count: 20)
    @Published var assessmentRecord : [String] = Array(repeating: "Not Answered", count: 12)
    @Published var dateRecords: [Date] = Array(repeating: Date(), count: 2)
    @Published var riskFactor: [String] = []
    // 0 ~ 5 : Monofilament test, 6 ~ 11 : IPSWICH test
    // The score go up when the paitient say No
    @Published var MonofilamentScore : Int = 0
    @Published var IPSWICHScore : Int = 0
    
    @Published var userInfo : [String] = ["", "", ""]

}
