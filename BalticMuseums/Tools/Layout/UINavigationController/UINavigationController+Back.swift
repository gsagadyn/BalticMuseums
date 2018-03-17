//
//  UINavigationController+Back.swift
//  POPMobile-Tools
//
//  Created by Grzegorz Sagadyn on 27.02.2018.
//  Copyright © 2018 Speednet Sp. z o.o. All rights reserved.
//

import UIKit

public protocol INavigationControllerBack {
    func navigationShouldPopOnBackButton() -> Bool
}

extension UINavigationController: UINavigationBarDelegate {
    public func navigationBar(_ navigationBar: UINavigationBar, shouldPop item: UINavigationItem) -> Bool {
        if viewControllers.count < (navigationBar.items?.count ?? 0) {
            return true
        }
        
        let vc = topViewController as? INavigationControllerBack
        let interruptNavigation = !(vc?.navigationShouldPopOnBackButton() ?? true)
        
        guard interruptNavigation else {
            DispatchQueue.main.async { self.popViewController(animated: true) }
            return false
        }
        
        navigationBar
            .subviews
            .filter { $0.alpha < 1.0 }
            .forEach { view in
                UIView.animate(withDuration: 0.25, animations: {
                    view.alpha = 1.0
                })
            }
        
        return false
    }
}
