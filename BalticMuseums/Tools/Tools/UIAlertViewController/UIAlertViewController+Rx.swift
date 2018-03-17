//
//  UIAlertViewController+Rx.swift
//  POPMobile-Tools
//
//  Created by Karol Moluszys on 13.03.2018.
//  Copyright © 2018 Speednet Sp. z o.o. All rights reserved.
//

import UIKit
import RxSwift

public protocol RxAlertActionType {
    associatedtype Result

    var title: String? { get }
    var style: UIAlertActionStyle { get }
    var result: Result? { get }
}

public struct RxAlertAction<R>: RxAlertActionType {
    public typealias Result = R

    public let title: String?
    public let style: UIAlertActionStyle
    public let result: R?

    public init(title: String? = nil, style: UIAlertActionStyle = .default, result: R? = nil) {
        self.title = title
        self.style = style
        self.result = result
    }
}
