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
    var isProcessing = false
    
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
    // MARK: - Frame Did Change
    
    internal func session(_ session: ARSession, didUpdate frame: ARFrame) {
        guard !isProcessing else { return }
        isProcessing = true
        
        let detectBarcodesRequest = VNDetectBarcodesRequest { [weak self] (request, error) in
            let result = request.results?.first as? VNBarcodeObservation
            guard let barcodeObservation = result else { self?.isProcessing = false ; return }
            
            let barcodeDescriptor = barcodeObservation.barcodeDescriptor as? CIQRCodeDescriptor
            let barcodeValue = String(data: barcodeDescriptor?.data ?? Data(), encoding: .utf8) ?? ""
            print("QR Value: \(barcodeValue)")
            
            var rect = barcodeObservation.boundingBox
            rect = rect.applying(CGAffineTransform(scaleX: 1, y: -1))
            rect = rect.applying(CGAffineTransform(translationX: 0, y: 1))
            let center = CGPoint(x: rect.midX, y: rect.midY)
            
            DispatchQueue.main.async {
                self?.process(location: center, at: frame)
                self?.isProcessing = false
            }
        }
        
        DispatchQueue.global(qos: .userInitiated).async {
            detectBarcodesRequest.symbologies = [.QR]
            let imageRequestHandler = VNImageRequestHandler(cvPixelBuffer: frame.capturedImage, options: [:])
            do { try imageRequestHandler.perform([detectBarcodesRequest]) } catch { }
        }
    }
    
    // MARK: - Process Location
    
    private func process(location: CGPoint, at frame: ARFrame) {
        let hitTestResults = frame.hitTest(location, types: [.featurePoint] )
        guard let location = hitTestResults.first else { return }
        
        if let anchor = self.detectedDataAnchor, let node = self.sceneView.node(for: anchor) {
            node.transform = SCNMatrix4(location.worldTransform)
        } else {
            self.detectedDataAnchor = ARAnchor(transform: location.worldTransform)
            self.sceneView.session.add(anchor: self.detectedDataAnchor!)
        }
    }
}

// -----------------------------------------------------------------------------
// MARK: - ARSCNViewDelegate
// -----------------------------------------------------------------------------

extension Tab3ViewController: ARSCNViewDelegate {
    internal func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        return nil
    }
}
