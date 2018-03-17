//
//  UIView+Instantiate.swift
//  POPMobile-Tools
//
//  Created by Kamil Szuba Speednet on 12.02.2018.
//  Copyright © 2018 Speednet Sp. z o.o. All rights reserved.
//

import UIKit

public extension UIView {
    /// Creates view associated with NIB from code
    ///
    /// - Parameters:
    ///   - type: Subclass of UIView
    ///   - owner: Owner of the NIB file
    /// - Returns: Instance of UIView
    public static func instantiateView<T: UIView>(for type: T.Type = T.self, owner: Any? = nil) -> T {
        let bundle = Bundle(for: type)
        let nibName = String(describing: type)
        let nib = UINib(nibName: nibName, bundle: bundle)
        let instance = nib.instantiate(withOwner: owner, options: nil).first
        
        guard let view = instance as? T else {
           fatalError("NIB with name \"\(nibName)\" does not exist.")
        }
        
        return view
    }
    
    /// Creates view associated with current context
    ///
    /// - Parameters:
    ///   - owner: Owner of the NIB file
    /// - Returns: Instance of UIView
    public func instantiateView(owner: Any? = nil) -> Self {
        guard subviews.isEmpty else {
            return self
        }
        
        let loadedView = UIView.instantiateView(for: type(of: self), owner: owner)
        loadedView.frame = frame
        loadedView.autoresizingMask = autoresizingMask
        loadedView.translatesAutoresizingMaskIntoConstraints = translatesAutoresizingMaskIntoConstraints
        
        loadedView.addConstraints(constraints.flatMap { ctr -> NSLayoutConstraint? in
            guard let srcFirstItem = ctr.firstItem as? UIView else {
                return nil
            }
            
            let dstFirstItem = srcFirstItem == self ? loadedView : srcFirstItem
            let srcSecondItem = ctr.secondItem as? UIView
            let dstSecondItem = srcSecondItem == self ? loadedView : srcSecondItem
            
            return NSLayoutConstraint(item: dstFirstItem,
                                      attribute: ctr.firstAttribute,
                                      relatedBy: ctr.relation,
                                      toItem: dstSecondItem,
                                      attribute: ctr.secondAttribute,
                                      multiplier: ctr.multiplier,
                                      constant: ctr.constant)
        })
        
        return loadedView
    }
}
