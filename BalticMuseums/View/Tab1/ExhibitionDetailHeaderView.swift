//
//  ExhibitionDetailHeaderView.swift
//  BalticMuseums
//
//  Created by Maciej Durazinski on 17.03.2018.
//  Copyright © 2018 Grzegorz Sagadyn. All rights reserved.
//

import UIKit
import SnapKit

class ExhibitionDetailHeaderView: ParallaxTableViewHeaderView {
	
	let imageView = UIImageView()
	let label = UILabel()
    let blurView = UIVisualEffectView(effect: UIBlurEffect(style: UIBlurEffectStyle.extraLight))
    
    var blurEnabled: Bool = false {
        didSet {
            percentageChanged(value: percentageScroll)
        }
    }
    
	override init(tableView: UITableView, minHeight: CGFloat, maxHeight: CGFloat) {
		super.init(tableView: tableView, minHeight: minHeight, maxHeight: maxHeight)
		blurView.alpha = 0.0
        
        addSubview(blurView)
        blurView.snp.remakeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
		addSubview(imageView)
		imageView.contentMode = UIViewContentMode.scaleAspectFill
		imageView.snp.remakeConstraints { (make) in
			make.edges.equalToSuperview()
		}
		
		addSubview(label)
		label.numberOfLines = 2
		label.snp.remakeConstraints { (make) in
			make.left.equalToSuperview().offset(14.0)
			make.bottom.equalToSuperview().offset(-14.0)
			make.right.equalToSuperview().offset(-14.0)
		}
		
		clipsToBounds = true
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}

    override func percentageChanged(value: CGFloat) {
        guard blurEnabled else {
            return
        }
        
        blurView.alpha = 1.0 - value
    }
    
}
