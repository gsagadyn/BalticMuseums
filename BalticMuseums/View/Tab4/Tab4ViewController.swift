//
//  Tab4ViewController.swift
//  BalticMuseums
//
//  Created by Kamil Szuba on 17.03.2018.
//  Copyright © 2018 Grzegorz Sagadyn. All rights reserved.
//

import UIKit
import Snapify

class Tab4ViewController: UserInterfaceLayer.Controller<Tab4Presenter>, UIStoryboardInstantiate {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: "main")
    }
}
