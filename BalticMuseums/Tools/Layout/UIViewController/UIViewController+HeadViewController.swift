//
//  UIViewController+HeadViewController.swift
//  POPMobile-Tools
//
//  Created by Grzegorz Sagadyn on 21.02.2018.
//  Copyright © 2018 Speednet Sp. z o.o. All rights reserved.
//

import UIKit

public extension UIViewController {
    public var headViewController: UIViewController {
        return UIViewController.headViewController(relativeTo: self)
    }
    
    public static func headViewController(relativeTo viewController: UIViewController) -> UIViewController {
        if viewController.presentedViewController != nil,
            let child = viewController.presentedViewController {
            return headViewController(relativeTo: child)
        } else if
            let navigationController = viewController as? UINavigationController,
            let child = navigationController.visibleViewController {
            return headViewController(relativeTo: child)
        } else if
            let tabBarController = viewController as? UITabBarController,
            let child = tabBarController.selectedViewController {
            return headViewController(relativeTo: child)
        } else {
            return viewController
        }
    }
}
