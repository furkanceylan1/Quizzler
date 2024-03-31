//
//  Question.swift
//  Quizzler
//
//  Created by Furkan Ceylan on 31.03.2024.
//

import Foundation

struct Question {
    var text: String
    var answer: Bool
    
    init(q: String, a: Bool) {
        self.text = q
        self.answer = a
    }
}
