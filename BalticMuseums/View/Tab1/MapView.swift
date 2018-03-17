//
//  MapView.swift
//  BalticMuseums
//
//  Created by Maciej Durazinski on 17.03.2018.
//  Copyright © 2018 Grzegorz Sagadyn. All rights reserved.
//

import UIKit

enum Exhibition : Int {
	case Lecture
	case Human
	case InvisibleForces
	case TreeOfLife
	case LaboratoryRoom
	case RestRoom
	case Kid
	case Hydro
	case Health
	case WorkshopRoom
	case TempExhibition
	case CloakRoom
	case Toilets
	case FamilyRoom
	case GuestCloakRoom
	case Cash
	case Entrance
	case Shop
	case PortableScene
}

protocol MapViewDelegate: NSObjectProtocol {
	func didSelectExhibition(exhibition: UIImageView)
}

class MapView: UIView {
	
	@IBOutlet weak var lectureRoom: UIImageView!
	@IBOutlet weak var human: UIImageView!
	@IBOutlet weak var invisibleForces: UIImageView!
	@IBOutlet weak var treeOfLife: UIImageView!
	@IBOutlet weak var laboratoryRoom: UIImageView!
	@IBOutlet weak var restRoom: UIImageView!
	@IBOutlet weak var kid: UIImageView!
	@IBOutlet weak var hydro: UIImageView!
	@IBOutlet weak var health: UIImageView!
	@IBOutlet weak var workshopRoom: UIImageView!
	@IBOutlet weak var tempExhibition: UIImageView!
	@IBOutlet weak var cloakRoom: UIImageView!
	@IBOutlet weak var toilets: UIImageView!
	@IBOutlet weak var familyRoom: UIImageView!
	@IBOutlet weak var guestCloakRoom: UIImageView!
	@IBOutlet weak var cash: UIImageView!
	@IBOutlet weak var entrance: UIImageView!
	@IBOutlet weak var shop: UIImageView!
	@IBOutlet weak var portableScene: UIImageView!
	
	weak var delegate: MapViewDelegate?
	var selectedExibition: Exhibition? {
		didSet {
			if let exhibition = selectedExibition {
				print(exhibition)

				for subview in subviews {
					subview.layer.removeAllAnimations()
				}
				
				let pulseAnimation = CABasicAnimation(keyPath: #keyPath(CALayer.opacity))
				pulseAnimation.duration = 1
				pulseAnimation.fromValue = 0.3
				pulseAnimation.toValue = 1
				pulseAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
				pulseAnimation.autoreverses = true
				pulseAnimation.repeatCount = .greatestFiniteMagnitude
				
				let selectedExhibition = exhibitionForType(exhibition)
				selectedExhibition.layer.add(pulseAnimation, forKey: "animateOpacity")
				delegate?.didSelectExhibition(exhibition: selectedExhibition)
			}
		}
	}
	
	@IBOutlet weak var mapImageView: UIImageView!
	
	override var intrinsicContentSize: CGSize {
		return mapImageView.intrinsicContentSize
	}

	override func awakeAfter(using aDecoder: NSCoder) -> Any? {
		return self.instantiateView(owner:nil)
	}
	
	func exhibitionForType(_ type: Exhibition) -> UIImageView {
		switch type {
		case .Lecture:
			return lectureRoom
		case .Human:
			return human
		case .InvisibleForces:
			return invisibleForces
		case .TreeOfLife:
			return treeOfLife
		case .LaboratoryRoom:
			return laboratoryRoom
		case .RestRoom:
			return restRoom
		case .Kid:
			return kid
		case .Hydro:
			return hydro
		case .Health:
			return health
		case .WorkshopRoom:
			return workshopRoom
		case .TempExhibition:
			return tempExhibition
		case .CloakRoom:
			return cloakRoom
		case .Toilets:
			return toilets
		case .FamilyRoom:
			return familyRoom
		case .GuestCloakRoom:
			return guestCloakRoom
		case .Cash:
			return cash
		case .Entrance:
			return entrance
		case .Shop:
			return shop
		case .PortableScene:
			return portableScene
		}
	}
}
