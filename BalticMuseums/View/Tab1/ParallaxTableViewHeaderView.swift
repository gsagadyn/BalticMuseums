//
//  ParallaxTableViewHeaderView.swift
//  BalticMuseums
//
//  Created by Maciej Durazinski on 17.03.2018.
//  Copyright © 2018 Grzegorz Sagadyn. All rights reserved.
//

import UIKit
import RxCocoa

class ParallaxTableViewHeaderView: UIView {

	var percentageScroll: CGFloat = 0.0
	
	init(tableView: UITableView, minHeight:CGFloat, maxHeight:CGFloat) {
		super.init(frame: CGRect.zero)
		
		tableView.addSubview(self)
		tableView.contentInset = UIEdgeInsetsMake(CGFloat(maxHeight), tableView.contentInset.left, tableView.contentInset.bottom, tableView.contentInset.right)
		
		tableView.rx.contentOffset.subscribe { (event) in
			if let contentOffset = event.element {
				let adjustedContentOffsetY = contentOffset.y + maxHeight
				var height = maxHeight - adjustedContentOffsetY
				
				if height <= minHeight {
					height = minHeight
				}
								
				self.frame = CGRect(x: 0, y: contentOffset.y, width: tableView.frame.width, height: height)
				
				var tmpPercentageScroll = 1 - (adjustedContentOffsetY / (maxHeight - minHeight))
				if height <= minHeight {
					tmpPercentageScroll = 0
				}
				
				if height >= maxHeight {
					tmpPercentageScroll = 1
				}
				
				self.percentageScroll = tmpPercentageScroll
			}
		}
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}

}
