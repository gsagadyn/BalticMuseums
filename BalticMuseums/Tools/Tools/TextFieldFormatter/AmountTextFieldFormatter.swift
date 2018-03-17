//
//  AmountTextFieldFormatter.swift
//  POPMobile-Tools
//
//  Created by Grzegorz Sagadyn on 16.02.2018.
//  Copyright © 2018 Speednet Sp. z o.o. All rights reserved.
//

import UIKit

public class AmountTextFieldFormatter: TextFieldFormatter {
    // MARK: - Private Properties
    
    private let locale: Locale
    private let currencyCode: String
    private var decimalSeparator: String {
        return (locale.decimalSeparator ?? ",")
    }
    private var groupingSeparator: String {
        return (locale.groupingSeparator ?? " ")
    }
    private var allowedCharacterSet: CharacterSet {
        return CharacterSet(charactersIn: "0123456789.," + decimalSeparator + groupingSeparator)
    }
    
    // MARK: - Initializers
    
    public init(locale: Locale = Locale(identifier: "fi"), currencyCode: String = "EUR") {
        self.locale = locale
        self.currencyCode = currencyCode
    }
    
    // MARK: - Formatters
    
    public func formatted(value: String, for state: UIControlState) -> String {
        guard state != .highlighted else {
            let value = value .apiFormattedAmount(locale: locale)
            return value.replacingOccurrences(of: ".", with: decimalSeparator)
        }
        
        return value.uiFormattedAmount(locale: locale, currencyCode: currencyCode)
    }
    
    public func isValid(_ value: String) -> Bool {
        let apiFormattedAmount = value.apiFormattedAmount(locale: locale)
        let valueCharacterSet = CharacterSet(charactersIn: value)
        let number = NumberFormatter().number(from: apiFormattedAmount)
        return value.count == 0 || (valueCharacterSet.isSubset(of: allowedCharacterSet) && number != nil)
    }
}
