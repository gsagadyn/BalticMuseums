//
//  VideoNode.swift
//  BalticMuseums
//
//  Created by Grzegorz Sagadyn on 17.03.2018.
//  Copyright © 2018 Grzegorz Sagadyn. All rights reserved.
//

import Foundation
import SceneKit
import ARKit
import Vision
import SpriteKit

public class VideoNode: SCNNode {
    private let videoRendererNode = SCNNode()
    private let player = AVPlayer()
    
    // MARK: - Materials
    
    private lazy var playerMaterial: SCNMaterial = {
        let material = SCNMaterial()
        material.diffuse.contents = player
        return material
    }()
    private var mainMaterial: SCNMaterial {
        let material = SCNMaterial()
        material.diffuse.contents = UIColor.black
        return material
    }
    
    // MARK: - Initialization
    
    public override init() {
        super.init()
        initialization()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialization()
    }
}

// -----------------------------------------------------------------------------
// MARK: - Player Managment
// -----------------------------------------------------------------------------

public extension VideoNode {
    public func play(url: URL?) {
        guard let url = url else { return }
        let item = AVPlayerItem(url: url)
        player.replaceCurrentItem(with: item)
    }
    
    public func pause() {
        player.pause()
    }
}

// -----------------------------------------------------------------------------
// MARK: - Private Extension
// -----------------------------------------------------------------------------

private extension VideoNode {
    private func initialization() {
        physicsBody = SCNPhysicsBody(type: .static, shape: nil)
        name = String(describing: type(of: self))
        geometry?.materials = [playerMaterial, mainMaterial, mainMaterial, mainMaterial, mainMaterial, mainMaterial]
    }
}
