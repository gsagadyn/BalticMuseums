//
//  ExhibitionDetailViewController.swift
//  BalticMuseums
//
//  Created by Maciej Durazinski on 17.03.2018.
//  Copyright © 2018 Grzegorz Sagadyn. All rights reserved.
//

import UIKit

class ExhibitionDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
	
	@IBOutlet weak var tableView: UITableView!
	@IBOutlet weak var closeButton: UIButton!
	var selectedExibition: Exhibition?
	var header: ExhibitionDetailHeaderView? {
		didSet {
			updateView()
		}
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		tableView.layoutIfNeeded()
		header = ExhibitionDetailHeaderView(tableView: tableView, minHeight: 100, maxHeight: 300)
		
		closeButton.setImage(UIImage(named: "close")?.withRenderingMode(UIImageRenderingMode.alwaysTemplate), for: UIControlState.normal)
		closeButton.tintColor = UIColor(named: "main")
	}
	
	@IBAction func closeAction(_ sender: Any) {
		dismiss(animated: true, completion: nil)
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 2
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier", for: indexPath)
		return cell
	}
	
	func updateView() {
		header?.imageView.image = exhibitionImageForType(selectedExibition!)
	}
	
	func exhibitionImageForType(_ type: Exhibition) -> UIImage {
		switch type {
		case .Lecture:
			return UIImage(named: "exhibition_kierunek_zdrowie")!
		case .Human:
			return UIImage(named: "exhibition_czlowiek")!
		case .InvisibleForces:
			return UIImage(named: "exhibition_sily")!
		case .TreeOfLife:
			return UIImage(named: "exhibition_drzewo")!
		case .LaboratoryRoom:
			return UIImage(named: "exhibition_kierunek_zdrowie")!
		case .RestRoom:
			return UIImage(named: "exhibition_kierunek_zdrowie")!
		case .Kid:
			return UIImage(named: "exhibition_kierunek_zdrowie")!
		case .Hydro:
			return UIImage(named: "exhibition_hydro")!
		case .Health:
			return UIImage(named: "exhibition_zdrowie")!
		case .WorkshopRoom:
			return UIImage(named: "exhibition_kierunek_zdrowie")!
		case .TempExhibition:
			return UIImage(named: "exhibition_kierunek_zdrowie")!
		case .CloakRoom:
			return UIImage(named: "exhibition_kierunek_zdrowie")!
		case .Toilets:
			return UIImage(named: "exhibition_kierunek_zdrowie")!
		case .FamilyRoom:
			return UIImage(named: "exhibition_kierunek_zdrowie")!
		case .GuestCloakRoom:
			return UIImage(named: "exhibition_kierunek_zdrowie")!
		case .Cash:
			return UIImage(named: "exhibition_kierunek_zdrowie")!
		case .Entrance:
			return UIImage(named: "exhibition_kierunek_zdrowie")!
		case .Shop:
			return UIImage(named: "exhibition_kierunek_zdrowie")!
		case .PortableScene:
			return UIImage(named: "exhibition_kierunek_zdrowie")!
		}
	}
}
