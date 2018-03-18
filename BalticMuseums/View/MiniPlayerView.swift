//
//  MiniPlayerView.swift
//  BalticMuseums
//
//  Created by Maciej Durazinski on 18.03.2018.
//  Copyright © 2018 Grzegorz Sagadyn. All rights reserved.
//

import UIKit

class MiniPlayerView: UIView {

	override func awakeAfter(using aDecoder: NSCoder) -> Any? {
		return self.instantiateView(owner:nil)
	}

}
