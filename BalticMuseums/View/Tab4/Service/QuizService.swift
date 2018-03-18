//
//  QuizService.swift
//  BalticMuseums
//
//  Created by Tomasz Marzeion on 17/03/2018.
//  Copyright © 2018 Grzegorz Sagadyn. All rights reserved.
//

class QuizService {
    
    static var highscore: [QuizHighscoreModel] = [
        QuizHighscoreModel(username: "Kamil", score: 1530),
        QuizHighscoreModel(username: "Grześ", score: 1260),
        QuizHighscoreModel(username: "Maciek", score: 1160),
        QuizHighscoreModel(username: "Świeży", score: 260)
    ]
    
    static func getQuizQuestions() -> [QuizQuestionModel] {
        return [
            QuizQuestionModel(
                question: "Pytanie 1", answers: [
                    QuizAnswerModel(answer: "Odpowiedź 1", correct: true),
                    QuizAnswerModel(answer: "Odpowiedź 2", correct: false),
                    QuizAnswerModel(answer: "Odpowiedź 3", correct: false),
                    QuizAnswerModel(answer: "Odpowiedź 4", correct: false)
                    ],
                category: "Kategoria 1"),
            QuizQuestionModel(
                question: "Pytanie 2", answers: [
                    QuizAnswerModel(answer: "Odpowiedź 1", correct: false),
                    QuizAnswerModel(answer: "Odpowiedź 2", correct: true),
                    QuizAnswerModel(answer: "Odpowiedź 3", correct: false),
                    QuizAnswerModel(answer: "Odpowiedź 4", correct: false)
                ],
                category: "Kategoria 2"),
            QuizQuestionModel(
                question: "Pytanie 3", answers: [
                    QuizAnswerModel(answer: "Odpowiedź 1", correct: false),
                    QuizAnswerModel(answer: "Odpowiedź 2", correct: false),
                    QuizAnswerModel(answer: "Odpowiedź 3", correct: true),
                    QuizAnswerModel(answer: "Odpowiedź 4", correct: false)
                ],
                category: "Kategoria 3")
        ]
    }
    
    static func getQuizHighscore() -> [QuizHighscoreModel] {
        return highscore
    }
    
    static func addQuizHighscore(username: String, score: Int) {
        highscore.append(QuizHighscoreModel(username: username, score: score))
    }
}
