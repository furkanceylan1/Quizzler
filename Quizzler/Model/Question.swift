//
//  Question.swift
//  Quizzler
//
//  Created by Furkan Ceylan on 31.03.2024.
//

import Foundation

struct Question {
    var text: String
    var answer: [String]
    var correctAnswer: String
    
    init(q: String, a: [String], correctAnswer: String) {
        self.text = q
        self.answer = a
        self.correctAnswer = correctAnswer
    }
}
