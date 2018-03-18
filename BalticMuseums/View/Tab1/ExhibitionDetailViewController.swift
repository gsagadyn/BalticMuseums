//
//  ExhibitionDetailViewController.swift
//  BalticMuseums
//
//  Created by Maciej Durazinski on 17.03.2018.
//  Copyright © 2018 Grzegorz Sagadyn. All rights reserved.
//

import UIKit

class ExhibitionDetailViewController: UIViewController {
	
	@IBOutlet weak var closeButton: UIButton!
	var selectedExibition: Exhibition?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
	}
	
	@IBAction func closeAction(_ sender: Any) {
		dismiss(animated: true, completion: nil)
	}
	
}
