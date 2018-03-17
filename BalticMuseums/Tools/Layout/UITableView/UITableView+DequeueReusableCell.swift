//
//  UITableView+DequeueReusableCell.swift
//  POPMobile-Tools
//
//  Created by Grzegorz Sagadyn on 27.02.2018.
//  Copyright © 2018 Speednet Sp. z o.o. All rights reserved.
//

import UIKit

public extension UITableView {
    public func registerCell<T: UITableViewCell>(_ cellClass: T.Type, bundle: Bundle? = nil) {
        let identifier = String(describing: cellClass)
        let bundle = bundle ?? Bundle.main
        
        if bundle.path(forResource: identifier, ofType: "nib") != nil {
            let nib = UINib(nibName: identifier, bundle: bundle)
            register(nib, forCellReuseIdentifier: identifier)
        } else {
            register(cellClass, forCellReuseIdentifier: identifier)
        }
    }
    
    public func dequeueReusableCell<T: UITableViewCell>(_ cellClass: T.Type = T.self, for indexPath: IndexPath) -> T {
        let identifier = String(describing: cellClass)
        guard let cell = dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? T else {
            fatalError("Cell with type \"\(identifier)\" not found.")
        }
        
        return cell
    }
}
