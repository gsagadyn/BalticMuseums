//
//  RadialGradienLayer.swift
//  BalticMuseums
//
//  Created by Tomasz Marzeion on 17/03/2018.
//  Copyright © 2018 Grzegorz Sagadyn. All rights reserved.
//

import UIKit

public class RadialGradientLayer: CALayer {
    // MARK: - Public Properties
    public typealias GradientDescriptor = (firstColor: UIColor, secondColor: UIColor, start: CGPoint, radius: CGFloat, locations: [CGFloat])
    public var gradientDescriptor: GradientDescriptor = (.clear, .clear, CGPoint(x: 0.5, y: 0.5), 0.5, [0.0, 1.0]) {
        didSet {
            setNeedsDisplay()
            setNeedsLayout()
        }
    }
    public override func draw(in ctx: CGContext) {
        let descriptor = gradientDescriptor
        
        let colors = [descriptor.firstColor.cgColor, descriptor.secondColor.cgColor] as CFArray
        let endRadius = min(bounds.width, bounds.height) * descriptor.radius
        let center = CGPoint(x: (bounds.width * descriptor.start.x), y: (bounds.height * descriptor.start.y))
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        
        guard let gradient = CGGradient(colorsSpace: colorSpace, colors: colors, locations: descriptor.locations) else {
            return
        }
        ctx.drawRadialGradient(gradient, startCenter: center, startRadius: 0.0, endCenter: center, endRadius: endRadius, options: .drawsAfterEndLocation)
    }
}

