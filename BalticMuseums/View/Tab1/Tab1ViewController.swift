//
//  Tab1ViewController.swift
//  BalticMuseums
//
//  Created by Kamil Szuba on 17.03.2018.
//  Copyright © 2018 Grzegorz Sagadyn. All rights reserved.
//

import UIKit
import Snapify

class Tab1ViewController: UserInterfaceLayer.Controller<Tab1Presenter>, UIStoryboardInstantiate {
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .green
    }
}
