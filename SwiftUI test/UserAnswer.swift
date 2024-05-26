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
//    @Published var userDetails: [String] = Array(repeating: "Not given", count: 4)
    @Published var answerRecord: [String] = Array(repeating: "Not Answered", count: 20)
    @Published var assessmentRecord : [String] = Array(repeating: "Not Answered", count: 12)
    @Published var timeRecords: [Date] = Array(repeating: Date(), count: 2)
    @Published var assessmentTime: TimeInterval = 0
    @Published var riskFactor: [String] = Array(repeating: "Fuck", count : 25)
    
    // 0 ~ 5 : Monofilament test, 6 ~ 11 : IPSWICH test
    // The score go up when the paitient say No
    @Published var MonofilamentScore : Int = 0
    @Published var IPSWICHScore : Int = 0
    @Published var system_g_risk = ""
    @Published var user_s_risk = ""
    @Published var pdf_url : URL?
    //stratTime.timeIntervalSince(endTime)


    

    @Published var userInfo : [String] = ["", "", ""]
    
    func updateAnswerRecord(at index: Int, with value: String) {
            guard index >= 0 && index < answerRecord.count else {
                return
            }
            answerRecord[index] = value
        }
}
