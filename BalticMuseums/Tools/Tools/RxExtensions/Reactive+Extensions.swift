//
//  Reactive+Extensions.swift
//  POPMobile-Tools
//
//  Created by Karol Moluszys on 13.03.2018.
//  Copyright © 2018 Speednet Sp. z o.o. All rights reserved.
//

import UIKit
import RxSwift

extension Reactive where Base: UIAlertController {
    public static func present<Action: RxAlertActionType>(viewController: UIViewController,
                                                          actions: [Action],
                                                          preferredStyle: UIAlertControllerStyle = .alert,
                                                          title: String? = nil,
                                                          message: String? = nil,
                                                          animated: Bool = true) -> Observable<(action: Action, index: Int)> {
        return Observable.create { observer in
            let alertController = UIAlertController(title: title, message: message, preferredStyle: preferredStyle)

            actions.enumerated().map { index, rxAction in
                UIAlertAction(title: rxAction.title, style: rxAction.style, handler: { _ in
                    observer.onNext((action: rxAction, index: index))
                    observer.onCompleted()
                })
                }
                .forEach(alertController.addAction)

            viewController.present(alertController, animated: animated, completion: nil)

            return Disposables.create {
                alertController.dismiss(animated: true, completion: nil)
            }
        }
    }
}
