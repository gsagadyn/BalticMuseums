//
//  CollectionViewItem.swift
//  POPMobile-Tools
//
//  Created by Grzegorz Sagadyn on 06.03.2018.
//  Copyright © 2018 Speednet Sp. z o.o. All rights reserved.
//

import UIKit

public protocol ICollectionViewItem {
    func item(for collectionView: UICollectionView, at indexPath: IndexPath) -> UICollectionViewCell
}

// -----------------------------------------------------------------------------
// MARK: - ICollectionViewItem Implementation
// -----------------------------------------------------------------------------

open class CollectionViewItem<T: UICollectionViewCell>: ICollectionViewItem {
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

public extension CollectionViewItem {
    public final var reuseIdentifier: String {
        return String(describing: T.self)
    }
}

// -----------------------------------------------------------------------------
// MARK: - Dequeue
// -----------------------------------------------------------------------------

public extension CollectionViewItem {
    public final func item(for collectionView: UICollectionView, at indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        
        if let item = cell as? T {
            prepare(item: item)
        }
        
        return cell
    }
}
