//
//  UIResponder+HideApplicationContent.swift
//  POPMobile-Tools
//
//  Created by Grzegorz Sagadyn on 21.02.2018.
//  Copyright © 2018 Speednet Sp. z o.o. All rights reserved.
//

import UIKit

public extension UIResponder {
    private static var _applicationContentCoverView: UIView?
    public var applicationContentCoverView: UIView? {
        get {
            return UIResponder._applicationContentCoverView
        }
        set {
            UIResponder._applicationContentCoverView?.removeFromSuperview()
            UIResponder._applicationContentCoverView = newValue
        }
    }

    public var isApplicationContentHidden: Bool {
        get {
            return UIResponder._applicationContentCoverView?.superview != nil
        }
        set {
            let window = UIApplication.shared.keyWindow ?? UIWindow()
            guard let coverView = UIResponder._applicationContentCoverView else {
                return
            }
            
            coverView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            coverView.frame = window.bounds
            
            if newValue {
                window.addSubview(coverView)
            } else {
                coverView.removeFromSuperview()
            }
        }
    }
}
