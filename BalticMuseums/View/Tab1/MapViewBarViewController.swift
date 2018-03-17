//
//  MapViewBarViewController.swift
//  BalticMuseums
//
//  Created by Maciej Durazinski on 17.03.2018.
//  Copyright © 2018 Grzegorz Sagadyn. All rights reserved.
//

protocol MapViewBarViewControllerDelegate: NSObjectProtocol {
	func didSelectBottomBar()
}

import UIKit

class MapViewBarViewController: UIViewController {

	@IBOutlet weak var label: UILabel!
	@IBOutlet weak var iconImageView: UIImageView!

	weak var delegate: MapViewBarViewControllerDelegate?
	var selectedExibition: Exhibition? {
		didSet {
			label.text = String.exhibitionTitleForType(selectedExibition!)
		}
	}

    override func viewDidLoad() {
        super.viewDidLoad()

		let tapGesture = UITapGestureRecognizer()
		tapGesture.addTarget(self, action: #selector(handleTapGesture))
		view.addGestureRecognizer(tapGesture)
		
		iconImageView.image = UIImage(named:"disclosure_left")?.withRenderingMode(UIImageRenderingMode.alwaysTemplate)
		iconImageView.tintColor = UIColor(named:"main")
    }

	@objc func handleTapGesture() {
		self.delegate?.didSelectBottomBar()
	}

}
