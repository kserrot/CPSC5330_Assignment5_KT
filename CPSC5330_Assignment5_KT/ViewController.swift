//
//  ViewController.swift
//  CPSC5330_Assignment5_KT
//
//  Created by Kaique Torres on 2/9/24.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var background: UIImageView!
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var buttonOne: UIButton!
    
    @IBOutlet weak var buttonTwo: UIButton!
    
    
    var quizlogic = QuizLogic()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        
    }
    
    @IBAction func answerSubimitted(_ sender: UIButton) {
        
        guard let userAnswer = sender.titleLabel?.text else{return}
        
        if userAnswer == "Restart"{
            quizlogic.resetQuiz()
            updateUI()
            return
        }
        
        let isCorrect = quizlogic.compareUserResponse(userAnswer)
        
        sender.backgroundColor = isCorrect ? UIColor.green : UIColor.red
        
        quizlogic.increaseIndex(selecOption: userAnswer)
        
        Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI(){
        if quizlogic.isQuizCompleted() {
            background.image = UIImage(named: quizlogic.finalBackgroundImageName())
            questionLabel.text = "Quiz Completed"
            buttonOne.setTitle("Restart", for: .normal)
            buttonTwo.setTitle("Restart", for: .normal)
            
        }else{
            questionLabel.text = quizlogic.getNextQuestion()
            background.image = UIImage(named: "image\(quizlogic.getImageName())")
            buttonOne.setTitle(quizlogic.getChoiceOne(), for: .normal)
            buttonTwo.setTitle(quizlogic.getChoiceTwo(), for: .normal)
            
            buttonOne.backgroundColor = UIColor.clear
            buttonTwo.backgroundColor = UIColor.clear
        }
    }
    
}
