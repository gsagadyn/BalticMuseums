//
//  TextFieldFormatter.swift
//  POPMobile-Tools
//
//  Created by Grzegorz Sagadyn on 16.02.2018.
//  Copyright © 2018 Speednet Sp. z o.o. All rights reserved.
//

import UIKit

public protocol TextFieldFormatter {
    func formatted(value: String, for state: UIControlState) -> String
    func isValid(_ value: String) -> Bool
}
