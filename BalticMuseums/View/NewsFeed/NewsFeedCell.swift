//
//  NewsFeedCell.swift
//  BalticMuseums
//
//  Created by Tomasz Marzeion on 18/03/2018.
//  Copyright © 2018 Grzegorz Sagadyn. All rights reserved.
//

import UIKit

class NewsFeedCell: UITableViewCell {
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var firstImage: UIImageView!
    @IBOutlet private weak var cardView: UIView!
    @IBOutlet weak var shadowView: UIView!
    
    var model: NewsFeedModel? {
        didSet {
            updateUI()
        }
    }
    
    func updateUI() {
        guard let model = model else { return }
        clipsToBounds = false
        
        descriptionLabel.text = model.text
        firstImage.image = model.photos[0]
        cardView.layer.cornerRadius = 8.0
        shadowView.layer.cornerRadius = 8.0
        
        shadowView.layer.shadowColor = UIColor.black.cgColor
        shadowView.layer.shadowOpacity = 0.6
        shadowView.layer.shadowOffset = CGSize.zero
        shadowView.layer.shadowRadius = 10
    }
}
