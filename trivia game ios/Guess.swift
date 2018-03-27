//
//  Guess.swift
//  trivia game ios
//
//  Created by Americo Lopez on 3/22/18.
//  Copyright © 2018 Americo Lopez. All rights reserved.
//

import UIKit

class Question {
    var questionText: String
    var answers: [String]
    var correctAnswer: Int

    init(questionText: String, answers: [String], correctAnswer: Int ){
        self.answers = answers
        self.correctAnswer = correctAnswer
        self.questionText = questionText
    }

}
