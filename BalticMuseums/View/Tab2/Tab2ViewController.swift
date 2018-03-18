//
//  Tab3ViewController.swift
//  BalticMuseums
//
//  Created by Kamil Szuba on 17.03.2018.
//  Copyright © 2018 Grzegorz Sagadyn. All rights reserved.
//

import UIKit
import Snapify

class Tab2ViewController: UserInterfaceLayer.Controller<Tab2Presenter>, UIStoryboardInstantiate  {
    @IBOutlet weak var textView: UITextView!

    let beaconManager = EstimoteService()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .darkGray

        beaconManager.delegate = self

        textView.text = ""
    }

    func print(_ text: String) {
        textView.text = textView.text + text + "\r\n"
        let bottom = NSMakeRange(textView.text.count - 1, 1)
        textView.scrollRangeToVisible(bottom)
    }
}

extension Tab2ViewController: EstimoteServiceDelegate {
    func didChangedAuthorizaiton(status: CLAuthorizationStatus) {
        print("didChangedAuthorizaiton: \(status)")
    }

    func didFindBeaconZone() {
        print("didFindBeaconZone")
    }

    func didLoseBeaconZone() {
        print("func didLoseBeaconZone")
    }

    func didDiscover(beaconId: Int) {
        print("didDiscover beaconId: \(beaconId)")
    }
}
