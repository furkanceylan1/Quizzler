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
    
    let quiz: [Question] = [
        Question(q: "İstanbul Türkiye'nin başkenti.", a: false),
        Question(q: "Bir yıl 365 gün sürer.", a: true),
        Question(q: "Atatürk 20. yüzyılın en büyük liderlerinden biridir.", a: true),
        Question(q: "Futbol bir kış sporudur.", a: false),
        Question(q: "Türkiye'nin en kalabalık şehri Ankara'dır.", a: false),
        Question(q: "Dünya'nın en büyük okyanusu Atlantik Okyanusu'dur.", a: false),
        Question(q: "Ay ışık veren bir yıldızdır.", a: false),
        Question(q: "Su ısındıkça genleşir.", a: true),
        Question(q: "Başkentimiz İstanbul'dur.", a: false),
        Question(q: "Ananas bir meyvedir.", a: true)
    ]
    
    var questionNumber = 0
    var timer = Timer()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        questionLabel.text = quiz[questionNumber].text
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle?.uppercased()
        let actualAnswer = String(quiz[questionNumber].answer).uppercased()
        
        if userAnswer == actualAnswer {
            sender.backgroundColor = .systemGreen
        }else {
            sender.backgroundColor = .systemRed
        }
        
        if questionNumber + 1 < quiz.count {
            questionNumber += 1
        }else {
            questionLabel.text = "End of Quiz"
            questionNumber = 0
        }
        updateUI()
    }
    
    func updateUI() {
        questionLabel.text = quiz[questionNumber].text
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(self.clearBackground), userInfo: nil, repeats: true)
    }
    
    @objc func clearBackground() {
        trueButton.backgroundColor = .clear
        falseButton.backgroundColor = .clear
    }
}

