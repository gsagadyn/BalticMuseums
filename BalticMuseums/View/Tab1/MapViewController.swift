//
//  Tab1ViewController.swift
//  BalticMuseums
//
//  Created by Kamil Szuba on 17.03.2018.
//  Copyright © 2018 Grzegorz Sagadyn. All rights reserved.
//

import UIKit
import Snapify

class MapViewController: UserInterfaceLayer.Controller<Tab1Presenter>, UIStoryboardInstantiate, MapViewDelegate, UIScrollViewDelegate, MapViewBarViewControllerDelegate, EstimoteServiceDelegate {
	
	@IBOutlet weak var mapView: MapView!
	@IBOutlet weak var scrollView: UIScrollView!
	@IBOutlet weak var bottomConstraint: NSLayoutConstraint!
	
	let estimoteService = EstimoteService()
	var mapViewBarViewController: MapViewBarViewController?
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
        view.backgroundColor = .white
		
		mapView.delegate = self
		
		let widthScale = scrollView.frame.width / mapView.bounds.width
		let heightScale = scrollView.frame.height / mapView.bounds.height
		let maxScale = min(widthScale, heightScale)
		
		scrollView.maximumZoomScale = maxScale
		scrollView.delegate = self
		
		bottomConstraint.constant = -70
		view.setNeedsDisplay()
		
		estimoteService.delegate = self
    }
	
	func didSelectExhibition(exhibition: UIImageView) {
		scrollView.zoom(to: exhibition.frame, animated: true)
		
		var rect = exhibition.frame
		rect.origin.x *= scrollView.zoomScale - rect.width / 2
		rect.origin.y *= scrollView.zoomScale - rect.height / 2
		rect.size.width *= scrollView.zoomScale + rect.width
		rect.size.height *= scrollView.zoomScale + rect.height
		
		scrollView.scrollRectToVisible(rect, animated: true)
		
		showBar()
	}
	
	func viewForZooming(in scrollView: UIScrollView) -> UIView? {
		return mapView
	}
	
	func didSelectBottomBar() {
		
		performSegue(withIdentifier: "ExhibitionDetail", sender: mapView.selectedExibition)
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "MapViewBarViewControllerSegue" {
			mapViewBarViewController = segue.destination as? MapViewBarViewController
			mapViewBarViewController?.delegate = self
		} else if segue.identifier == "ExhibitionDetail" {
			let detailViewController = segue.destination as? ExhibitionDetailViewController
			detailViewController?.selectedExibition = mapView.selectedExibition
		}
	}
	
	func hideBar() {
		bottomConstraint.constant = -70
		UIView.animate(withDuration: 0.3) {
			self.view.layoutIfNeeded()
		}
	}
	
	func showBar() {
		
		let playerView = MiniPlayerView()
		tabBarController?.view.addSubview(playerView)
		playerView.snp.remakeConstraints { (make) in
			make.left.equalToSuperview()
			make.right.equalToSuperview()
			make.bottom.equalTo((tabBarController?.tabBar.snp.top)!)
			make.height.equalTo(100)
		}
		
//		bottomConstraint.constant = -10
//		mapViewBarViewController?.selectedExibition = mapView.selectedExibition
//		UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.6, options: UIViewAnimationOptions.curveEaseOut, animations: {
//			self.view.layoutIfNeeded()
//		}, completion: nil)
	}
	
	func didChangedAuthorizaiton(status: CLAuthorizationStatus) {
		
	}
	
	func didFindBeaconZone() {
		
	}
	
	@IBAction func beaconEmergencyButton(_ sender: Any) {
		if mapView.selectedExibition == .TreeOfLife {
			mapView.selectedExibition = Exhibition.Health
		} else {
			mapView.selectedExibition = Exhibition.TreeOfLife
		}
		
	}
	
	func didDiscover(beaconId: Int) {
		if beaconId == 9294 {
			mapView.selectedExibition = Exhibition.TreeOfLife
		} else if beaconId == 9000 {
			mapView.selectedExibition = Exhibition.Health
		}
	}
	
	func didLoseBeaconZone() {
		
	}
	
	
}
