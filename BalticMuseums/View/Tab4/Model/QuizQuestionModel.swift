//
//  QuizQuestionModel.swift
//  BalticMuseums
//
//  Created by Tomasz Marzeion on 17/03/2018.
//  Copyright © 2018 Grzegorz Sagadyn. All rights reserved.
//

struct QuizQuestionModel {
    var question: String
    var answers: [QuizAnswerModel]
    var category: String
}

struct QuizAnswerModel {
    var answer: String
    var correct: Bool
}
