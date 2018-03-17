//
//  RadialGradientButton.swift
//  BalticMuseums
//
//  Created by Tomasz Marzeion on 17/03/2018.
//  Copyright © 2018 Grzegorz Sagadyn. All rights reserved.
//


import UIKit

@IBDesignable
public class RadialGradientButton: UIButton {
    // MARK: - IBInspectable Properties
    
    @IBInspectable public var gradientFirstColor: UIColor {
        get {
            return backgroundView.gradientFirstColor
            
        }
        set {
            backgroundView.gradientFirstColor = newValue
            
        }
    }
    @IBInspectable public var gradientSecondColor: UIColor {
        get {
            return backgroundView.gradientSecondColor
        }
        set {
            backgroundView.gradientSecondColor = newValue
        }
    }
    @IBInspectable public var gradientStart: CGPoint {
        get {
            return backgroundView.gradientStart
        }
        set {
            backgroundView.gradientStart = newValue
        }
    }
    @IBInspectable public var gradientRadius: CGFloat {
        get {
            return backgroundView.gradientRadius
        }
        set {
            backgroundView.gradientRadius = newValue
        }
    }
    
    // MARK: - Public Properties
    
    public override var isEnabled: Bool {
        willSet {
            backgroundView.isHidden = !newValue
        }
    }
    
    // MARK: - Private Properties
    
    private let backgroundView = RadialGradientView()
    
    // MARK: - Initialization
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        initialization()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialization()
    }
    
    // MARK: - Layout
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        sendSubview(toBack: backgroundView)
    }
}

// -----------------------------------------------------------------------------
// MARK: - Private Extension
// -----------------------------------------------------------------------------

private extension RadialGradientButton {
    func initialization() {
        addSubview(backgroundView)
        backgroundView.frame = bounds
        backgroundView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        backgroundView.isHidden = !isEnabled
    }
}

