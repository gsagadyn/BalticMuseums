//
//  Tab4ViewController.swift
//  BalticMuseums
//
//  Created by Kamil Szuba on 17.03.2018.
//  Copyright © 2018 Grzegorz Sagadyn. All rights reserved.
//

import UIKit
import Snapify

let currentUsername = "Baltathon"

class Tab4ViewController: UIViewController, UIStoryboardInstantiate {
    
    private var hasUserCompletedQuiz: Bool = false {
        didSet {
            scoreLabel.isHidden = !hasUserCompletedQuiz
            scoreInfoLabel.isHidden = !hasUserCompletedQuiz
            startQuizButton.isHidden = hasUserCompletedQuiz
            shareButton.isHidden = !hasUserCompletedQuiz
        }
    }
    
    @IBOutlet private weak var scoreLabel: UILabel!
    @IBOutlet private weak var scoreInfoLabel: UILabel!
    @IBOutlet private weak var startQuizButton: UIButton!
    @IBOutlet private weak var shareButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        hasUserCompletedQuiz = false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let quizVC = segue.destination as? QuizViewController {
            quizVC.deletage = self
        }
    }
    
    @IBAction func share() {
        let alert = UIAlertController(title: "Gotowe!", message: "Udostępniono na facebooku!", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Zamknij", style: UIAlertActionStyle.default, handler: { _ in
            self.dismiss(animated: true)
        }))
        self.present(alert, animated: true, completion: nil)
    }
}

extension Tab4ViewController: QuizViewControllerDelegate {
    func quizViewController(_ quizViewController: QuizViewController, didReturn score: Int) {
        hasUserCompletedQuiz = true
        scoreLabel.text = "\(score)"
        QuizService.addQuizHighscore(username: currentUsername, score: score)
    }
}
