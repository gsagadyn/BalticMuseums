//
//  UICollectionView+DequeueReusableView.swift
//  POPMobile-Tools
//
//  Created by Grzegorz Sagadyn on 06.03.2018.
//  Copyright © 2018 Speednet Sp. z o.o. All rights reserved.
//

import UIKit

public extension UICollectionView {
    public func registerHeaderView<T: UICollectionReusableView>(_ viewClass: T.Type, bundle: Bundle? = nil) {
        registerView(viewClass, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, bundle: bundle)
    }
    
    public func registerFooterView<T: UICollectionReusableView>(_ viewClass: T.Type, bundle: Bundle? = nil) {
        registerView(viewClass, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, bundle: bundle)
    }
    
    public func registerView<T: UICollectionReusableView>(_ viewClass: T.Type, forSupplementaryViewOfKind kind: String, bundle: Bundle? = nil) {
        let identifier = String(describing: viewClass)
        let bundle = bundle ?? Bundle.main
        
        if bundle.path(forResource: identifier, ofType: "nib") != nil {
            let nib = UINib(nibName: identifier, bundle: bundle)
            register(nib, forSupplementaryViewOfKind: kind, withReuseIdentifier: identifier)
        } else {
            register(viewClass, forSupplementaryViewOfKind: kind, withReuseIdentifier: identifier)
        }
    }
    
    public func dequeueReusableSupplementaryHeaderView<T: UICollectionReusableView>(withClass viewClass: T.Type = T.self, for indexPath: IndexPath) -> T {
        return dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withClass: viewClass, for: indexPath)
    }
    
    public func dequeueReusableSupplementaryFooterView<T: UICollectionReusableView>(withClass viewClass: T.Type = T.self, for indexPath: IndexPath) -> T {
        return dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionFooter, withClass: viewClass, for: indexPath)
    }
    
    public func dequeueReusableSupplementaryView<T: UICollectionReusableView>(ofKind kind: String, withClass viewClass: T.Type = T.self, for indexPath: IndexPath) -> T {
        let identifier = String(describing: viewClass)
        
        guard let view = dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: identifier, for: indexPath) as? T else {
            fatalError("Reusable view with type \"\(identifier)\" and kind \"\(kind)\" not found.")
        }
        
        return view
    }
}
