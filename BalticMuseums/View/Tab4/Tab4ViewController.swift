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
    
    @IBOutlet private weak var scoreLabel: UILabel!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let quizVC = segue.destination as? QuizViewController {
            quizVC.deletage = self
        }
    }
}

extension Tab4ViewController: QuizViewControllerDelegate {
    func quizViewController(_ quizViewController: QuizViewController, didReturn score: Int) {
        scoreLabel.text = "\(score)"
        QuizService.addQuizHighscore(username: currentUsername, score: score)
    }
}
