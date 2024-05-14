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
    @Published var answerRecord: [String] = Array(repeating: "Not Answered", count: 20)
    @Published var assessmentRecord : [String] = Array(repeating: "Not Answered", count: 12)
}
