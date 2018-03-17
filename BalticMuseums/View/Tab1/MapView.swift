//
//  MapView.swift
//  BalticMuseums
//
//  Created by Maciej Durazinski on 17.03.2018.
//  Copyright © 2018 Grzegorz Sagadyn. All rights reserved.
//

import UIKit

class MapView: UIView {
	
	@IBOutlet weak var mapImageView: UIImageView!
	
	override var intrinsicContentSize: CGSize {
		return mapImageView.intrinsicContentSize
	}

	override func awakeAfter(using aDecoder: NSCoder) -> Any? {
		return self.instantiateView(owner:nil)
	}
}
