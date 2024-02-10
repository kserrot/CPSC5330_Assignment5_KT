//
//  Question.swift
//  CPSC5330_Assignment5_KT
//
//  Created by Kaique Torres on 2/9/24.
//

import Foundation

struct Question{
    
    init(_ ques: String, _o_one:String, _o_two:String, _ ans:String){
        question = ques
        option_one = _o_one
        option_two = _o_two
        answer = ans
    }
    
    var question: String
    var answer: String
    var option_one: String
    var option_two: String
}
