//
//  NSAttributedString+Concatenate.swift
//  POPMobile-Tools
//
//  Created by Grzegorz Sagadyn on 28.02.2018.
//  Copyright © 2018 Speednet Sp. z o.o. All rights reserved.
//

import Foundation

public typealias AttributedString = NSAttributedString

public extension AttributedString {
    public static func + (lhs: AttributedString, rhs: AttributedString) -> AttributedString {
        let result = NSMutableAttributedString()
        result.append(lhs)
        result.append(rhs)
        return result
    }
    
    public static func += (lhs: inout AttributedString, rhs: AttributedString) {
        let result = NSMutableAttributedString()
        result.append(lhs)
        result.append(rhs)
        lhs = result
    }
}
