//
//  QuizLogic.swift
//  CPSC5330_Assignment5_KT
//
//  Created by Kaique Torres on 2/9/24.
//

import Foundation

struct QuizLogic {
    
    var questionIndex : Int = 0
    var score : Int = 0
    
    let question = [
        
                Question("You are driving in a intersection, the light is yellow..",
                         _o_one: "speed up",
                         _o_two: "slow down",
                         "speed up"),
                
                
                Question("you sped up , there was a cop hidden ",
                         _o_one: "Run from the cop",
                         _o_two: "Pull over",
                         "Run from the cop"),
                
                /*
                 ************************
                WINNING BACKGROUND/ LOSING BACKGROUND
                 you got away      / Jail 25 Years
                 ************************
                 
                 
                 
                 Question("you slowed down, the old lady rear ended you",
                          _o_one: "call the cops",
                          _o_two: "let her slide",
                          "let her slide"),
                 
    
                 ************************
                WINNING BACKGROUND/ LOSING BACKGROUND
                 Got a new Car      / she still managed to wreck into you next week
                 ************************
                 
                 */
                
            ]
    
    mutating func compareUserResponse(_ response: String) -> Bool {
        if response == question[questionIndex].answer {
            score += 1
            return true
        } else {
            return false
        }
    }
    
    mutating func increaseIndex() {
        if questionIndex < question.count-1 {
            questionIndex += 1
        } else {
            questionIndex = 0
        }
    }
    
    func getNextQuestion() -> String {
        return question[questionIndex].question
    }
    
    func getChoiceOne() -> String {
        return question[questionIndex].option_one
    }
    
    func getChoiceTwo() -> String {
        return question[questionIndex].option_two
    }
    
    func getImageName() -> Int {
        return questionIndex + 1
    }
    
}
