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
        
        let userAnswer = sender.titleLabel!.text!
        
        let isCorrect = quizlogic.compareUserResponse(userAnswer)
        
        if isCorrect{
            sender.backgroundColor = UIColor.green
        } else{
            sender.backgroundColor = UIColor.red
        }
        
        quizlogic.increaseIndex()
        
        Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI(){
        
        questionLabel.text = quizlogic.getNextQuestion()
        background.image = UIImage(named: "image\(quizlogic.getImageName())")
        buttonOne.setTitle(quizlogic.getChoiceOne(), for: .normal)
        buttonTwo.setTitle(quizlogic.getChoiceTwo(), for: .normal)
        
        buttonOne.backgroundColor = UIColor.clear
        buttonTwo.backgroundColor = UIColor.clear
    }
}

