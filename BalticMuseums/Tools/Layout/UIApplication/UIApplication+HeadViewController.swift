//
//  UIApplication+HeadViewController.swift
//  POPMobile-Tools
//
//  Created by Grzegorz Sagadyn on 21.02.2018.
//  Copyright © 2018 Speednet Sp. z o.o. All rights reserved.
//

import UIKit

public extension UIApplication {
    public var headViewController: UIViewController? {
        guard
            let window = keyWindow,
            let rootViewController = window.rootViewController else {
            return nil
        }
        
        return rootViewController.headViewController
    }
}
