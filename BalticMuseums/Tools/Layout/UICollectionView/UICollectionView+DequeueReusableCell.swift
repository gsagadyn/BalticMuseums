//
//  UICollectionView+DequeueReusableCell.swift
//  POPMobile-Tools
//
//  Created by Kamil Szuba Speednet on 22.02.2018.
//  Copyright © 2018 Speednet Sp. z o.o. All rights reserved.
//

import UIKit

public extension UICollectionView {
    public func registerCell<T: UICollectionViewCell>(_ cellClass: T.Type, bundle: Bundle? = nil) {
        let identifier = String(describing: cellClass)
        let bundle = bundle ?? Bundle.main
        
        if bundle.path(forResource: identifier, ofType: "nib") != nil {
            let nib = UINib(nibName: identifier, bundle: bundle)
            register(nib, forCellWithReuseIdentifier: identifier)
        } else {
            register(cellClass, forCellWithReuseIdentifier: identifier)
        }
    }
    
    public func dequeueReusableCell<T: UICollectionViewCell>(_ cellClass: T.Type = T.self, for indexPath: IndexPath) -> T {
        let identifier = String(describing: cellClass)
        guard let cell = dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? T else {
            fatalError("Cell with type \"\(identifier)\" not found.")
        }
        
        return cell
    }
}
