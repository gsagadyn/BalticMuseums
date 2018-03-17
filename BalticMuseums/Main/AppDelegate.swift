//
//  AppDelegate.swift
//  BalticMuseums
//
//  Created by Grzegorz Sagadyn on 16.03.2018.
//  Copyright © 2018 Grzegorz Sagadyn. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let keyboardManager = IQKeyboardManager.sharedManager()
        keyboardManager.toolbarDoneBarButtonItemText = "Gotowe"
        keyboardManager.shouldShowToolbarPlaceholder = false
        keyboardManager.keyboardDistanceFromTextField = 36.0
        keyboardManager.enable = true

        return true
    }
}

