//
//  QuizService.swift
//  BalticMuseums
//
//  Created by Tomasz Marzeion on 17/03/2018.
//  Copyright © 2018 Grzegorz Sagadyn. All rights reserved.
//

class QuizService {
    
    static var highscore: [QuizHighscoreModel] = [
        QuizHighscoreModel(username: "Kamil", score: 1230),
        QuizHighscoreModel(username: "Grześ", score: 1180),
        QuizHighscoreModel(username: "Maciek", score: 1160),
        QuizHighscoreModel(username: "Świeży", score: 260)
    ]
    
    static func getQuizQuestions() -> [QuizQuestionModel] {
        return [
            QuizQuestionModel(
                question: "Która z tych planet jest największa?", answers: [
                    QuizAnswerModel(answer: "Mars", correct: false),
                    QuizAnswerModel(answer: "Ziemia", correct: false),
                    QuizAnswerModel(answer: "Uran", correct: true),
                    QuizAnswerModel(answer: "Neptun", correct: false)
                    ],
                category: "Kosmos"),
            QuizQuestionModel(
                question: "Które ze zjawisk kosmicznych ma tak wysoce skoncentrowaną masę i pole grawitacyjne, że nic, nawet światło, nie może pokonać jego grawitacji?", answers: [
                    QuizAnswerModel(answer: "Otwory robaczkowe", correct: false),
                    QuizAnswerModel(answer: "Ciemna materia", correct: false),
                    QuizAnswerModel(answer: "Czarne dziury", correct: true),
                    QuizAnswerModel(answer: "Gwizdy neutronowe", correct: false)
                ],
                category: "Kosmos"),
            QuizQuestionModel(
                question: "W chemii utlaniaczem nazywamy substancję ulegającą:", answers: [
                    QuizAnswerModel(answer: "Redukcji", correct: true),
                    QuizAnswerModel(answer: "Utlenieniu", correct: false),
                    QuizAnswerModel(answer: "Jonizacji", correct: false),
                    QuizAnswerModel(answer: "Reakcji", correct: false)
                ],
                category: "Chemia")
        ]
    }
    
    static func getQuizHighscore() -> [QuizHighscoreModel] {
        return highscore
    }
    
    static func addQuizHighscore(username: String, score: Int) {
        highscore.append(QuizHighscoreModel(username: username, score: score))
    }
}
