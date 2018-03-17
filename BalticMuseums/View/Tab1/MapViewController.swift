//
//  Tab1ViewController.swift
//  BalticMuseums
//
//  Created by Kamil Szuba on 17.03.2018.
//  Copyright © 2018 Grzegorz Sagadyn. All rights reserved.
//

import UIKit
import Snapify

class MapViewController: UserInterfaceLayer.Controller<Tab1Presenter>, UIStoryboardInstantiate, MapViewDelegate, UIScrollViewDelegate, MapViewBarViewControllerDelegate {
	
	@IBOutlet weak var mapView: MapView!
	@IBOutlet weak var scrollView: UIScrollView!
	@IBOutlet weak var bottomConstraint: NSLayoutConstraint!
	
	var mapViewBarViewController: MapViewBarViewController?
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		Timer.scheduledTimer(withTimeInterval: 5, repeats: false) { (Timer) in
			self.mapView.selectedExibition = Exhibition(rawValue: Int(arc4random() % 19))
		}
		
        view.backgroundColor = .white
		
		mapView.delegate = self
		
		let widthScale = scrollView.frame.width / mapView.bounds.width * 1.3
		let heightScale = scrollView.frame.height / mapView.bounds.height * 1.3
		let maxScale = min(widthScale, heightScale)
		
		scrollView.maximumZoomScale = maxScale
		scrollView.delegate = self
		
		bottomConstraint.constant = -70
		view.setNeedsDisplay()
    }
	
	func didSelectExhibition(exhibition: UIImageView) {
		scrollView.zoom(to: exhibition.frame, animated: true)
		
		var rect = exhibition.frame
		rect.origin.x *= scrollView.zoomScale
		rect.origin.y *= scrollView.zoomScale
		rect.size.width *= scrollView.zoomScale
		rect.size.height *= scrollView.zoomScale
		
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
		}
	}
	
	func hideBar() {
		bottomConstraint.constant = -70
		UIView.animate(withDuration: 0.3) {
			self.view.layoutIfNeeded()
		}
	}
	
	func showBar() {
		bottomConstraint.constant = -10
		mapViewBarViewController?.selectedExibition = mapView.selectedExibition
		UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.6, options: UIViewAnimationOptions.curveEaseOut, animations: {
			self.view.layoutIfNeeded()
		}, completion: nil)
	}
	
}
