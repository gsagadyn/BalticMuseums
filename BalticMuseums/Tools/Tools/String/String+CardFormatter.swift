//
//  String+CardFormatter.swift
//  POPMobile-Tools
//
//  Created by Grzegorz Sagadyn on 05.03.2018.
//  Copyright © 2018 Speednet Sp. z o.o. All rights reserved.
//

import Foundation

public extension String {
    public func uiFormattedCardNumber() -> String {
        let nrb = apiFormattedCardNumber()
        
        guard nrb.count == 16 else {
            return nrb
        }
        
        return String(enumerated()
            .map { ($0.offset + 1) % 4 == 0 ? [$0.element, " "] : [$0.element] }
            .flatMap { $0 })
            .replacingOccurrences(of: "X", with: "*")
            .trim()
    }
    
    public func apiFormattedCardNumber() -> String {
        return components(separatedBy: .whitespacesAndNewlines)
            .joined()
            .replacingOccurrences(of: "*", with: "X")
    }
}
