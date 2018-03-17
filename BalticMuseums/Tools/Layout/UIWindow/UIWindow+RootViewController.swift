//
//  UIWindow+RootViewController.swift
//  POPMobile-Tools
//
//  Created by Grzegorz Sagadyn on 20.02.2018.
//  Copyright © 2018 Speednet Sp. z o.o. All rights reserved.
//

import UIKit

public extension UIWindow {
    public func setRootViewController(viewController: UIViewController, animated: Bool = true, completion: ((Bool) -> Swift.Void)? = nil) {
        guard animated else {
            rootViewController = viewController
            completion?(true)
            return
        }
        
        let snapshot = snapshotView(afterScreenUpdates: true) ?? UIView(frame: viewController.view.bounds)
        viewController.view.addSubview(snapshot)
        rootViewController = viewController
        
        UIView.animate(withDuration: 0.3, delay: 0.2, options: [.curveEaseInOut], animations: {
            snapshot.alpha = 0.0
        }) { result in
            snapshot.removeFromSuperview()
            completion?(result)
        }
    }
}
