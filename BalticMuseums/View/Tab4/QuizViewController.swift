//
//  QuizViewController.swift
//  BalticMuseums
//
//  Created by Tomasz Marzeion on 17/03/2018.
//  Copyright © 2018 Grzegorz Sagadyn. All rights reserved.
//

import UIKit

protocol  QuizViewControllerDelegate: class {
    func quizViewController(_ quizViewController: QuizViewController, didReturn score: Int)
}

class QuizViewController: UIViewController {
    
    let scoreGainForCorrentAnswer: Int = 500
    let scorePenaltyForSecond: Int = 10

    @IBOutlet private weak var timeLabel: UILabel!
    @IBOutlet private weak var categoryLabel: UILabel!
    @IBOutlet private weak var questionLabel: UILabel!
    @IBOutlet private weak var firstAnswerButton: UIButton!
    @IBOutlet private weak var secondAnswerButton: UIButton!
    @IBOutlet private weak var thirdAnswerButton: UIButton!
    @IBOutlet private weak var fourthAnswerButton: UIButton!
    
    weak var deletage: QuizViewControllerDelegate?
    
    private var answerButtons: [UIButton] {
        return [ firstAnswerButton, secondAnswerButton, thirdAnswerButton, fourthAnswerButton ]
    }
    
    private lazy var questions: [QuizQuestionModel] = {
        return QuizService.getQuizQuestions().shuffled
    }()
    
    private var time: Int = 0
    private var timer = Timer()
    
    private var score: Int = 0
    private var currentQuestionIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        runTimer()
        prepareNextQuestion()
    }
    
    @IBAction func closeAction() {
        let alert = UIAlertController(title: "Potwierdź", message: "Czy na pewno chcesz zrezygnować?", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Zrezygnuj", style: UIAlertActionStyle.destructive, handler: { _ in
            self.score = 0
            self.showScoreAndDismiss()
        }))
        alert.addAction(UIAlertAction(title: "Cofnij", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func selectAnswerAction(_ sender: UIButton) {
        if questions[currentQuestionIndex].answers.filter({ $0.correct}).first?.answer == sender.currentTitle {
            score += scoreGainForCorrentAnswer
        }
        currentQuestionIndex += 1
        prepareNextQuestion()
    }
    
    func prepareNextQuestion() {
        guard currentQuestionIndex < questions.count else {
            showScoreAndDismiss()
            return
        }
        let question = questions[currentQuestionIndex]
        categoryLabel.text = question.category.uppercased()
        questionLabel.text = question.question
        
        let shuffledAnswers = question.answers.shuffled
        answerButtons.enumerated().forEach { (index, button) in
            button.setTitle(shuffledAnswers[index].answer, for: .normal)
        }
    }
    
    func showScoreAndDismiss() {
        stopTimer()
        score = max(score - (time * scorePenaltyForSecond), 0)
        deletage?.quizViewController(self, didReturn: score)
        let alert = UIAlertController(title: "Koniec", message: "Twój wynik to \(score) punktów.", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Zamknij", style: UIAlertActionStyle.default, handler: { _ in
            self.dismiss(animated: true)
        }))
        self.present(alert, animated: true, completion: nil)
    }
}

extension QuizViewController {
    func runTimer() {
        timeLabel.text = timeString(time: 0)
        timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(QuizViewController.updateTimer)), userInfo: nil, repeats: true)
    }
    
    func stopTimer() {
        timer.invalidate()
    }
    
    @objc func updateTimer() {
        time += 1
        timeLabel.text = "\(timeString(time: time))"
    }
    
    func timeString(time: Int) -> String {
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format:"%02i:%02i", minutes, seconds)
    }
}
