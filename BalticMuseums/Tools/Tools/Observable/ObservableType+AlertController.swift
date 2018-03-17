//
//  ObservableType+AlertController.swift
//  POPMobile-Tools
//
//  Created by Grzegorz Sagadyn on 28.02.2018.
//  Copyright © 2018 Speednet Sp. z o.o. All rights reserved.
//

import UIKit
import RxSwift

public extension ObservableType {
    public func catchErrorWithAlert(presentedBy viewController: UIViewController? = nil,
                                    title: String? = nil,
                                    message: String? = nil,
                                    cancelButtonTitle: String = "OK",
                                    forward: Bool = false) -> Observable<Self.E> {
        return self.catchError { [weak viewController] error -> Observable<Self.E> in
            let result: Observable<Self.E> = forward ? .error(error) : .empty()
            
            guard let vc = viewController ?? UIApplication.shared.headViewController else {
                return result
            }
            
            let localizedError = error as? ILocalizedError
            let message = localizedError?.errorFullDescription ?? message ?? error.localizedDescription
            let title = localizedError?.errorShortDescription ?? title
            
            DispatchQueue.main.async {
                let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: cancelButtonTitle, style: .cancel, handler: nil))
                vc.present(alert, animated: true, completion: nil)
            }
            
            return result
        }
    }
}
