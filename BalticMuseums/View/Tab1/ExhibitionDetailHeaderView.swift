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

	override init(tableView: UITableView, minHeight: CGFloat, maxHeight: CGFloat) {
		super.init(tableView: tableView, minHeight: minHeight, maxHeight: maxHeight)
		
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

}
