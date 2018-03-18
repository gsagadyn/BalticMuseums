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
    @IBOutlet private weak var secongImage: UIImageView!
    @IBOutlet private weak var thirdImage: UIImageView!
    
    var model: NewsFeedModel? {
        didSet {
            updateUI()
        }
    }
    
    func updateUI() {
        guard let model = model else { return }
        
        descriptionLabel.text = model.text
        firstImage.image = model.photos[0]
        secongImage.image = model.photos[1]
        thirdImage.image = model.photos[2]
    }
}
