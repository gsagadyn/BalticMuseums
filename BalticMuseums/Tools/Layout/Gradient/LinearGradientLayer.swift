//
//  LinearGradientLayer.swift
//  POPMobile-Views
//
//  Created by Grzegorz Sagadyn on 12.02.2018.
//  Copyright © 2018 Speednet Sp. z o.o. All rights reserved.
//

import UIKit

public class LinearGradientLayer: CALayer {
    // MARK: - Public Properties
    public typealias GradientDescriptor = (firstColor: UIColor, secondColor: UIColor, start: CGPoint, end: CGPoint, locations: [CGFloat])
    public var gradientDescriptor: GradientDescriptor = (.clear, .clear, .zero, CGPoint(x: 0.0, y: 1.0), [0.0, 1.0]) {
        didSet {
            setNeedsDisplay()
            setNeedsLayout()
        }
    }
    public override func draw(in ctx: CGContext) {
        let descriptor = gradientDescriptor
        
        let colors = [descriptor.firstColor.cgColor, descriptor.secondColor.cgColor] as CFArray
        let start = CGPoint(x: (bounds.width * descriptor.start.x), y: (bounds.height * descriptor.start.y))
        let end = CGPoint(x: (bounds.width * descriptor.end.x), y: (bounds.height * descriptor.end.y))
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        
        guard let gradient = CGGradient(colorsSpace: colorSpace, colors: colors, locations: descriptor.locations) else {
            return
        }
        ctx.drawLinearGradient(gradient, start: start, end: end, options: .drawsAfterEndLocation)
    }
}
