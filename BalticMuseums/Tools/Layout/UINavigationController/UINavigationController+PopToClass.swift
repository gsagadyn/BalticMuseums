//
//  UINavigationController+PopToClass.swift
//  POPMobile-Tools
//
//  Created by Grzegorz Sagadyn on 27.02.2018.
//  Copyright © 2018 Speednet Sp. z o.o. All rights reserved.
//

import UIKit

public extension UINavigationController {
    @discardableResult
    public func popToViewController<T: UIViewController>(withType type: T.Type, animated: Bool) -> [UIViewController]? {
        guard let vc = viewController(withType: type) else {
            return nil
        }
        
        return popToViewController(vc, animated: animated)
    }
    
    public func viewController<T: UIViewController>(withType type: T.Type) -> T? {
        return viewControllers
            .flatMap { $0 as? T }
            .last
    }
}
