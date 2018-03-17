//
//  String+AmountFormatter.swift
//  POPMobile-Tools
//
//  Created by Grzegorz Sagadyn on 27.02.2018.
//  Copyright © 2018 Speednet Sp. z o.o. All rights reserved.
//

import Foundation

public extension String {
    public func uiFormattedAmount(locale: Locale = Locale(identifier: "fi"), currencyCode: String? = "EUR") -> String {
        let numberFormatter = NumberFormatter()
        let currencyFormatter = NumberFormatter()
        currencyFormatter.numberStyle = .currency
        currencyFormatter.locale = locale
        currencyFormatter.currencyCode = currencyCode
        
        if locale.identifier == "fi" {
            currencyFormatter.decimalSeparator = ","
            currencyFormatter.currencyGroupingSeparator = "."
        }
            
        let apiFormattedAmount = self.apiFormattedAmount(locale: locale)
        guard let value = numberFormatter.number(from: apiFormattedAmount) else {
            return ""
        }
        
        return currencyFormatter.string(from: value) ?? ""
    }
    
    public func apiFormattedAmount(locale: Locale = Locale(identifier: "fi")) -> String {
        let groupingSeparator = locale.groupingSeparator ?? ","
        let decimalSeparator = locale.decimalSeparator ?? " "
        let allowedCharacterSet = CharacterSet(charactersIn: "-0123456789.," + decimalSeparator + groupingSeparator)
        
        var string = self
        string = string.replacingOccurrences(of: groupingSeparator, with: "")
        string = string.replacingOccurrences(of: decimalSeparator, with: ".")
        string = string.replacingOccurrences(of: ",", with: ".")
        
        let components = string.components(separatedBy: allowedCharacterSet.inverted)
        return components.joined()
    }
}
