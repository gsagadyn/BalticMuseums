//
//  UIView+HideAnimation.swift
//  POPMobile-Tools
//
//  Created by Grzegorz Sagadyn on 12.03.2018.
//  Copyright © 2018 Speednet Sp. z o.o. All rights reserved.
//

import UIKit

public extension UIView {
    public func setHidden(_ isHidden: Bool, withAnimationDuration duration: TimeInterval) {
        guard duration > 0.0 else {
            self.isHidden = isHidden
            return
        }
        
        let transition = CATransition()
        transition.duration = duration
        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        transition.type = kCATransitionFade
        transition.subtype = nil
        transition.isRemovedOnCompletion = true
        
        layer.add(transition, forKey: kCATransition)
        self.isHidden = isHidden
    }
}
