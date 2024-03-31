//
//  ViewController.swift
//  Quizzler
//
//  Created by Furkan Ceylan on 25.03.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var progressView: UIProgressView!
    
    var questionLibrary: QuestionLibrary = QuestionLibrary()
    var questionNumber = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        questionLabel.text = questionLibrary.quiz[0].text
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
        let question = questionLibrary.getQuestionText()
        questionLabel.text = question.text
        Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(self.clearBackground), userInfo: nil, repeats: false)
        progressView.progress = questionLibrary.getProgress()
        
    }
     
    @objc func clearBackground() {
        trueButton.backgroundColor = .clear
        falseButton.backgroundColor = .clear
    }
}

