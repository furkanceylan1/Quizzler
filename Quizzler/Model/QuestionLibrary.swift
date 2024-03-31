//
//  QuestionLibrary.swift
//  Quizzler
//
//  Created by Furkan Ceylan on 31.03.2024.
//

import Foundation

struct QuestionLibrary {
    
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
    
    var questionNumber: Int = 0
    
    func checkAnswer(_ userAnswer: String) -> Bool {
        if userAnswer.uppercased() == String(quiz[questionNumber].answer).uppercased() {
            return true
        }else {
            return false
        }
    }
    
    func getQuestionText() -> Question {
        return quiz[questionNumber]
    }
    
    func getProgress() -> Float {
        let progress = Float(questionNumber) / Float(quiz.count)
        return progress
    }
    
    mutating func nextQuestion() {
        if questionNumber + 1 < quiz.count {
            questionNumber += 1
        }else {
            questionNumber = 0
        }
    }
}
