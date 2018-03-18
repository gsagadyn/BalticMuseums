//
//  UIImage+Exhibition.swift
//  BalticMuseums
//
//  Created by Maciej Durazinski on 17.03.2018.
//  Copyright © 2018 Grzegorz Sagadyn. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
	
	static func exhibitionImageForType(_ type: Exhibition) -> UIImage {
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
