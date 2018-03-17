//
//  QuizHighscoreCell.swift
//  BalticMuseums
//
//  Created by Tomasz Marzeion on 17/03/2018.
//  Copyright © 2018 Grzegorz Sagadyn. All rights reserved.
//

import UIKit

class QuizHighscoreCell: UITableViewCell {
    
    @IBOutlet private weak var usernameLabel: UILabel!
    @IBOutlet private weak var scoreLabel: UILabel!
    
    @IBOutlet weak var noLabel: UILabel!

    
    var model: QuizHighscoreModel? {
        didSet {
            updateUI()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func updateUI() {
        guard let model = model else { return }
        usernameLabel.text = model.username
        scoreLabel.text = "\(model.score)"
        
        if model.username == currentUsername {
            usernameLabel.textColor = UIColor(named: "main")
            scoreLabel.textColor = UIColor(named: "main")
            noLabel.textColor = UIColor(named: "main")
        }
    }
}
