//
//  UILabel+TextAnimation.swift
//  POPMobile-Tools
//
//  Created by Grzegorz Sagadyn on 12.03.2018.
//  Copyright © 2018 Speednet Sp. z o.o. All rights reserved.
//

import UIKit

public extension UILabel {
    public func setText(_ text: String?, withAnimationDuration duration: TimeInterval) {
        guard duration > 0.0 else {
            self.text = text
            return
        }
        
        let transition = createFadeTransiotion(withDuration: duration)
        layer.add(transition, forKey: kCATransition)
        self.text = text
    }
    
    public func setAttributedText(_ attributedText: NSAttributedString?, withAnimationDuration duration: TimeInterval) {
        guard duration > 0.0 else {
            self.attributedText = attributedText
            return
        }
        
        let transition = createFadeTransiotion(withDuration: duration)
        layer.add(transition, forKey: kCATransition)
        self.attributedText = attributedText
    }
    
    // MARK: - Private Methods
    
    private func createFadeTransiotion(withDuration duration: TimeInterval) -> CATransition {
        let transition = CATransition()
        transition.duration = duration
        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        transition.type = kCATransitionFade
        transition.subtype = nil
        transition.isRemovedOnCompletion = true
        return transition
    }
}
