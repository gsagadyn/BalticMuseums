//
//  LinearGradientView.swift
//  POPMobile-Views
//
//  Created by Grzegorz Sagadyn on 12.02.2018.
//  Copyright © 2018 Speednet Sp. z o.o. All rights reserved.
//

import UIKit

@IBDesignable
public class LinearGradientView: UIView {
    // MARK: - Public Properties
    
    @IBInspectable public var gradientFirstColor: UIColor {
        get {
            return gradientLayer?.gradientDescriptor.firstColor ?? .clear
        }
        set {
            gradientLayer?.gradientDescriptor.firstColor = newValue
        }
    }
    @IBInspectable public var gradientSecondColor: UIColor {
        get {
            return gradientLayer?.gradientDescriptor.secondColor ?? .clear
        }
        set {
            gradientLayer?.gradientDescriptor.secondColor = newValue
        }
    }
    @IBInspectable public var gradientStart: CGPoint {
        get {
            return gradientLayer?.gradientDescriptor.start ?? .zero
        }
        set {
            gradientLayer?.gradientDescriptor.start = newValue
        }
    }
    @IBInspectable public var gradientEnd: CGPoint {
        get {
            return gradientLayer?.gradientDescriptor.end ?? .zero
        }
        set {
            gradientLayer?.gradientDescriptor.end = newValue
        }
    }
    public class override var layerClass: Swift.AnyClass {
        return LinearGradientLayer.self
    }
    public var gradientLayer: LinearGradientLayer? {
        return layer as? LinearGradientLayer
    }
    public var gradientLocations: [CGFloat] {
        get {
            return gradientLayer?.gradientDescriptor.locations ?? []
        }
        set {
            gradientLayer?.gradientDescriptor.locations = newValue
        }
    }
    
    // MARK: - Initialization
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        initialization()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialization()
    }
}

// -----------------------------------------------------------------------------
// MARK: - Private Extension
// -----------------------------------------------------------------------------

private extension LinearGradientView {
    func initialization() {
        backgroundColor = .clear
        isUserInteractionEnabled = false
    }
}
