//
//  MapView.swift
//  BalticMuseums
//
//  Created by Maciej Durazinski on 17.03.2018.
//  Copyright © 2018 Grzegorz Sagadyn. All rights reserved.
//

import UIKit

enum Exhibition {
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
	
	var selectedExibition: Exhibition? {
		didSet {
			
		}
	}
	
	@IBOutlet weak var mapImageView: UIImageView!
	
	override var intrinsicContentSize: CGSize {
		return mapImageView.intrinsicContentSize
	}

	override func awakeAfter(using aDecoder: NSCoder) -> Any? {
		return self.instantiateView(owner:nil)
	}
}
