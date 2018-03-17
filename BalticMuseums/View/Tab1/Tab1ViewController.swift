//
//  Tab1ViewController.swift
//  BalticMuseums
//
//  Created by Kamil Szuba on 17.03.2018.
//  Copyright © 2018 Grzegorz Sagadyn. All rights reserved.
//

import UIKit
import Snapify

class Tab1ViewController: UserInterfaceLayer.Controller<Tab1Presenter>, UIStoryboardInstantiate, MapViewDelegate, UIScrollViewDelegate {
	
	@IBOutlet weak var mapView: MapView!
	@IBOutlet weak var scrollView: UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()
		
		Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { (Timer) in
			self.mapView.selectedExibition = Exhibition(rawValue: Int(arc4random() % 19))
		}
		
        view.backgroundColor = .green
		
		mapView.delegate = self
		
		let widthScale = scrollView.frame.width / mapView.bounds.width * 1.5
		let heightScale = scrollView.frame.height / mapView.bounds.height * 1.5
		let minScale = min(widthScale, heightScale)
		
//		scrollView.minimumZoomScale = minScale
		scrollView.zoomScale = minScale
		scrollView.maximumZoomScale = minScale
		
		scrollView.delegate = self
    }
	
	func didSelectExhibition(exhibition: UIImageView) {
		scrollView.zoom(to: exhibition.frame, animated: true)
		
		var rect = exhibition.frame
		rect.origin.x *= scrollView.zoomScale
		rect.origin.y *= scrollView.zoomScale
		rect.size.width *= scrollView.zoomScale
		rect.size.height *= scrollView.zoomScale
		
		scrollView.scrollRectToVisible(rect, animated: true)
	}
	
	func viewForZooming(in scrollView: UIScrollView) -> UIView? {
		return mapView
	}
	
//	func scrollViewDidZoom(_ scrollView: UIScrollView) {
//
//	}
}
