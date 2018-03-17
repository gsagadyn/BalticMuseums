//
//  String+AccountFormatter.swift
//  POPMobile-Tools
//
//  Created by Grzegorz Sagadyn on 05.03.2018.
//  Copyright © 2018 Speednet Sp. z o.o. All rights reserved.
//

import Foundation

public extension String {
    public func uiFormattedAccountNumber() -> String {
        return String(apiFormattedAccountNumber().enumerated()
            .map { ($0.offset + 1) % 4 == 0 ? [$0.element, " "] : [$0.element] }
            .flatMap { $0 })
            .trim()
    }
    
    public func apiFormattedAccountNumber() -> String {
        return components(separatedBy: .whitespacesAndNewlines).joined()
    }
}
