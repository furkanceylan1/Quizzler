//
//  ViewController.swift
//  Quizzler
//
//  Created by Furkan Ceylan on 25.03.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    @IBOutlet weak var choice3Button: UIButton!
    @IBOutlet weak var progressView: UIProgressView!
    
    var questionLibrary: QuestionLibrary = QuestionLibrary()
    var questionNumber = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        updateUI()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        guard let userAnswer = sender.currentTitle else {return}
        let isAnswerCorrect = questionLibrary.checkAnswer(userAnswer)
        
        if isAnswerCorrect {
            sender.backgroundColor = .systemGreen
        }else {
            sender.backgroundColor = .systemRed
        }
        
        questionLibrary.nextQuestion()
        updateUI()
    }
    
    func updateUI() {
        var buttonArray : [UIButton] = [
            choice1Button,
            choice2Button,
            choice3Button
        ]
        let question = questionLibrary.getQuestionText()
        questionLabel.text = question.text
        
        for i in 0...2 {
            buttonArray[i].setTitle(question.answer[i], for: .normal)
        }
        scoreLabel.text = "Score: \(questionLibrary.getScore())"
        Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(self.clearBackground), userInfo: nil, repeats: false)
        progressView.progress = questionLibrary.getProgress()
        
    }
     
    @objc func clearBackground() {
        choice1Button.backgroundColor = .clear
        choice2Button.backgroundColor = .clear
        choice3Button.backgroundColor = .clear
    }
}

