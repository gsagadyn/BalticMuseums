//
//  QuizNavigationViewController.swift
//  BalticMuseums
//
//  Created by Tomasz Marzeion on 17/03/2018.
//  Copyright © 2018 Grzegorz Sagadyn. All rights reserved.
//

import UIKit
import Snapify

class QuizNavigationViewController: UINavigationController, UIStoryboardInstantiate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationBar.setBackgroundImage(withColor: .clear)
        navigationBar.setHairline(hidden: true)
        navigationBar.barTintColor = UIColor(named: "main")
        navigationBar.tintColor = UIColor(named: "main")
    }
}
