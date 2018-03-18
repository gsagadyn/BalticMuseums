//
//  MainViewController.swift
//  BalticMuseums
//
//  Created by Kamil Szuba on 18.03.2018.
//  Copyright © 2018 Grzegorz Sagadyn. All rights reserved.
//

import UIKit
import Snapify

class MainViewController: UserInterfaceLayer.Controller<MainPresenter>, UIStoryboardInstantiate {
    @IBOutlet weak var centerLogoImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    func showTabBar() {
        let vc = ViewStore.shared[TabBarViewController.self]
        vc.modalTransitionStyle = .crossDissolve
        present(vc, animated: true, completion: nil)
    }
}
