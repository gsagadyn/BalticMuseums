//
//  String+Tools.swift
//  POPMobile-Tools
//
//  Created by Grzegorz Sagadyn on 05.03.2018.
//  Copyright © 2018 Speednet Sp. z o.o. All rights reserved.
//

import Foundation

public extension String {
    public func trim(extended: Bool = false) -> String {
        let characterSet = CharacterSet.whitespacesAndNewlines
        
        if extended {
             return components(separatedBy: characterSet).joined(separator: " ")
        } else {
            return trimmingCharacters(in: characterSet)
        }
    }
}
