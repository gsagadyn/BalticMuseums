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
		header?.imageView.image = UIImage.exhibitionImageForType(selectedExibition!)
		header?.label.text = String.exhibitionTitleForType(selectedExibition!)

	}
	
}
