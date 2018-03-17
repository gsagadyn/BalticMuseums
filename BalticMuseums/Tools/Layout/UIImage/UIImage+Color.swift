//
//  UIImage+Color.swift
//  POPMobile-Tools
//
//  Created by Grzegorz Sagadyn on 20.02.2018.
//  Copyright © 2018 Speednet Sp. z o.o. All rights reserved.
//

import UIKit

public extension UIImage {
    public convenience init?(color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) {
        let imageRect = CGRect(origin: .zero, size: size)
        
        UIGraphicsBeginImageContextWithOptions(imageRect.size, false, 0.0)
        color.setFill()
        UIRectFill(imageRect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        guard let cgImage = image?.cgImage else {
            return nil
        }
        
        self.init(cgImage: cgImage)
    }
}
