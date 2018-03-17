//
//  UINavigationBar+Appearance.swift
//  POPMobile-Tools
//
//  Created by Grzegorz Sagadyn on 20.02.2018.
//  Copyright © 2018 Speednet Sp. z o.o. All rights reserved.
//

import UIKit

public extension UINavigationBar {
    public func setBackgroundImage(withColor color: UIColor) {
        let image = UIImage(color: color) ?? UIImage()
        setBackgroundImage(image, for: .default)
    }
    
    public func setHairline(hidden: Bool) {
        self.shadowImage = hidden ? UIImage() : nil
    }
}
