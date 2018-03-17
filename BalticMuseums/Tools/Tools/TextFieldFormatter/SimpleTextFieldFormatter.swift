//
//  SimpleTextFieldFormatter.swift
//  POPMobile-Tools
//
//  Created by Grzegorz Sagadyn on 26.02.2018.
//  Copyright © 2018 Speednet Sp. z o.o. All rights reserved.
//

import UIKit

public class SimpleTextFieldFormatter: TextFieldFormatter {
    // MARK: - Private Properties
    
    private let maxLength: UInt
    private let allowedCharacterSet: CharacterSet
    
    // MARK: - Initializers
    
    public init(maxLength: UInt = 32, allowedCharacterSet: CharacterSet = .alphanumerics) {
        self.maxLength = maxLength
        self.allowedCharacterSet = allowedCharacterSet
    }
    
    // MARK: - Formatters
    
    public func formatted(value: String, for state: UIControlState) -> String {
        let formattedValue = value.components(separatedBy: allowedCharacterSet.inverted).joined()
        return formattedValue.count > maxLength ? "" : formattedValue
    }
    
    public func isValid(_ value: String) -> Bool {
        let valueCharacterSet = CharacterSet(charactersIn: value)
        return value.count == 0 || (valueCharacterSet.isSubset(of: allowedCharacterSet) && value.count <= maxLength)
    }
}
