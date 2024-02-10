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
    var quizCompleted = false
    var path = ""
    
    let questions = [
        
        Question("You are driving in a intersection, the light is yellow..",
                 _o_one: "Speed Up",
                 _o_two: "Slow Down",
                 "Speed up"),
        
        
        Question("you sped up , there was a cop hidden ",
                 _o_one: "Run from the cop",
                 _o_two: "Pull over",
                 "Run from the cop"),
        
        
        Question("you slowed down, the old lady rear ended you",
                 _o_one: "Call the cops",
                 _o_two: "Let her slide",
                 "Let her slide"),
        
        
    ]
    
    mutating func compareUserResponse(_ response: String) -> Bool {
        
        let correctAnswer = questions[questionIndex].answer
        
            if response == correctAnswer{
                if !quizCompleted{
                    score += 1
                }
                return true
            } else {
                if !quizCompleted {
                    if questionIndex == 1 {
                        quizCompleted = true
                    }
                }
                return false
            }
    }
    
    mutating func increaseIndex(selecOption: String) {
        if questionIndex == 0 {
            path = selecOption
            questionIndex += 1
        } else if (path == "Speed Up" && selecOption == "Run from the cop") || (path == "Slow Down" && selecOption == "Call the cops") {
            quizCompleted = true
            score += 1  // Assuming this is the condition for winning
        } else if (path == "Speed Up" && selecOption == "Pull over") || (path == "Slow Down" && selecOption == "Let her slide") {
            quizCompleted = true
        }
    }
    
    mutating func resetQuiz(){
        questionIndex = 0
        score = 0
        quizCompleted = false
        path = ""
    }
    
    func getNextQuestion() -> String {
        if questionIndex == 0 {
            return questions[0].question
        } else if path == "Speed up" {
            return questions[1].question
        } else if path == "Slow Down" {
            return questions[2].question
        }
        return "Quiz Complete"
    }
    
    func getChoiceOne() -> String {
        if questionIndex == 0 {
            return questions[0].option_one
        } else if path == "Speed up" {
            return questions[1].option_one
        } else if path == "Slow Down" {
            return questions[2].option_one
        }
        return "Restart"
    }
        
    func getChoiceTwo() -> String {
        if questionIndex == 0 {
            return questions[0].option_two
        } else if path == "Speed Up" {
            return questions[1].option_two
        } else if path == "Slow Down" {
            return questions[2].option_two
        }
        return "Restart"
    }
            
            
    func getImageName() -> Int {
                return questionIndex + 1
            }
            
    func isQuizCompleted() -> Bool {
                return quizCompleted
            }
            
    func finalBackgroundImageName() -> String {
                return score >= 1 ? "winningBackGround" : "losingBackground"
            }
        }
