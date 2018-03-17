//
//  Tab3ViewController.swift
//  BalticMuseums
//
//  Created by Kamil Szuba on 17.03.2018.
//  Copyright © 2018 Grzegorz Sagadyn. All rights reserved.
//

import UIKit
import Snapify
import SceneKit
import ARKit
import Vision

class Tab3ViewController: UIViewController, UIStoryboardInstantiate {
    @IBOutlet var sceneView: ARSCNView!
    
    var detectedDataAnchor: ARAnchor?
    var processing = false
    
    // MARK: - View Controller Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sceneView.delegate = self
        sceneView.session.delegate = self
        sceneView.showsStatistics = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = .horizontal
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        sceneView.session.pause()
    }
}

// -----------------------------------------------------------------------------
// MARK: - ARSessionDelegate
// -----------------------------------------------------------------------------

extension Tab3ViewController: ARSessionDelegate {
    internal func session(_ session: ARSession, didUpdate frame: ARFrame) {
    }
}

// -----------------------------------------------------------------------------
// MARK: - ARSCNViewDelegate
// -----------------------------------------------------------------------------

extension Tab3ViewController: ARSCNViewDelegate {
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        return nil
    }
}


