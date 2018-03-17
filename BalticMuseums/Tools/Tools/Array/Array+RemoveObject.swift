//
//  Array+RemoveObject.swift
//  POPMobile-Tools
//
//  Created by Kamil Szuba Speednet on 12.02.2018.
//  Copyright © 2018 Speednet Sp. z o.o. All rights reserved.
//

import Foundation

public extension Array where Element: Equatable {
    @discardableResult
    public mutating func remove(object: Element) -> Bool {
        guard let index = index(of: object) else {
            return false
        }
        remove(at: index)
        return false
    }
    
    @discardableResult
    public mutating func remove(where predicate: (Array.Iterator.Element) -> Bool) -> Bool {
        guard let index = index(where: { predicate($0) }) else {
            return false
        }
        remove(at: index)
        return true
    }
}
