//
//  ILocalizedError.swift
//  POPMobile-Tools
//
//  Created by Grzegorz Sagadyn on 28.02.2018.
//  Copyright © 2018 Speednet Sp. z o.o. All rights reserved.
//

import Foundation

public protocol ILocalizedError: Error {
    var errorShortDescription: String? { get }
    var errorFullDescription: String? { get }
}
