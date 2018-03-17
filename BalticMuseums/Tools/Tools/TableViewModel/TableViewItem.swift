//
//  TableViewItem.swift
//  POPMobile-Tools
//
//  Created by Grzegorz Sagadyn on 07.03.2018.
//  Copyright © 2018 Speednet Sp. z o.o. All rights reserved.
//

import UIKit

public protocol ITableViewItem {
    func item(for tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell
}

// -----------------------------------------------------------------------------
// MARK: - ICollectionViewItem Implementation
// -----------------------------------------------------------------------------

open class TableViewItem<T: UITableViewCell>: ITableViewItem {
    // MARK: - Prepare Item
    
    open func prepare(item: T) {
        fatalError()
    }
    
    // MARK: - Initialize
    
    public init() {
    }
}

// -----------------------------------------------------------------------------
// MARK: - Identifier
// -----------------------------------------------------------------------------

public extension TableViewItem {
    public final var reuseIdentifier: String {
        return String(describing: T.self)
    }
}

// -----------------------------------------------------------------------------
// MARK: - Dequeue
// -----------------------------------------------------------------------------

public extension TableViewItem {
    public final func item(for tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        
        if let item = cell as? T {
            prepare(item: item)
        }
        
        return cell
    }
}
