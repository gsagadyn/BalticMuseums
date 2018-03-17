//
//  UICollectionView+ReloadDataAnimation.swift
//  POPMobile-Tools
//
//  Created by Grzegorz Sagadyn on 13.03.2018.
//  Copyright © 2018 Speednet Sp. z o.o. All rights reserved.
//

import UIKit

public extension UICollectionView {
    public typealias ReloadDataCompletion = () -> Void
    
    public func reloadData(animated: Bool, completion: ReloadDataCompletion? = nil) {
        let animationDuration = animated ? 0.3 : 0.0
        
        if animated {
            let transition = CATransition()
            transition.type = kCATransitionFade
            transition.subtype = nil
            transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
            transition.fillMode = kCAFillModeBoth
            transition.duration = animationDuration
            
            layer.add(transition, forKey: "UICollectionViewReloadDataAnimationKey")
        }
        
        reloadData()
        
        let deadlineTime = DispatchTime.now() + animationDuration
        DispatchQueue.main.asyncAfter(deadline: deadlineTime) {
            completion?()
        }
    }
}
