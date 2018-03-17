
//
//  QuizHighscoreViewController.swift
//  BalticMuseums
//
//  Created by Tomasz Marzeion on 17/03/2018.
//  Copyright © 2018 Grzegorz Sagadyn. All rights reserved.
//

import UIKit

class QuizHighscoreViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    
    private var highscores: [QuizHighscoreModel] {
        return QuizService.getQuizHighscore().sorted(by: { $0.score > $1.score })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension QuizHighscoreViewController: UITableViewDelegate {
    
}

extension QuizHighscoreViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return highscores.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuizHighscoreCell", for: indexPath) as! QuizHighscoreCell
        cell.model = highscores[indexPath.row]
        cell.noLabel.text = "\(indexPath.row + 1)."
        return cell
    }
}


