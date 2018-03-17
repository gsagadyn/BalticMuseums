//
//  RadialGradientView.swift
//  BalticMuseums
//
//  Created by Tomasz Marzeion on 17/03/2018.
//  Copyright © 2018 Grzegorz Sagadyn. All rights reserved.
//

import UIKit

@IBDesignable
public class RadialGradientView: UIView {
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
    @IBInspectable public var gradientRadius: CGFloat {
        get {
            return gradientLayer?.gradientDescriptor.radius ?? 0.0
        }
        set {
            gradientLayer?.gradientDescriptor.radius = newValue
        }
    }
    public class override var layerClass: Swift.AnyClass {
        return RadialGradientLayer.self
    }
    
    public var gradientLayer: RadialGradientLayer? {
        return layer as? RadialGradientLayer
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

private extension RadialGradientView {
    func initialization() {
        backgroundColor = .clear
        isUserInteractionEnabled = false
    }
}

