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
import SpriteKit

class Tab3ViewController: UIViewController, UIStoryboardInstantiate {
    @IBOutlet var sceneView: ARSCNView!
    @IBOutlet weak var alertView: UIView!
    
    var model = ["test": "cup.scn",
                 "i tak nie wygrasz": "2.mov"]
    
    var detectedDataAnchor: ARAnchor? {
        didSet {
            UIView.animate(withDuration: 0.3, delay: 0.0, options: [], animations: {
                self.alertView.alpha = 0.0
            }, completion: nil)
        }
    }
    var detectedDataType: String?
    var isProcessing = false
    
    // MARK: - View Controller Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sceneView.delegate = self
        sceneView.session.delegate = self
        alertView.layer.cornerRadius = 8.0
        alertView.clipsToBounds = true
    }
    
    @objc func playerItemDidReachEnd(notification: NSNotification) {
        if let playerItem: AVPlayerItem = notification.object as? AVPlayerItem {
            playerItem.seek(to: kCMTimeZero, completionHandler: nil)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = .horizontal
        sceneView.session.run(configuration)
        sceneView.alpha = 0.0
        alertView.alpha = 0.0
        alertView.transform = CGAffineTransform(scaleX: 0.0, y: 0.0)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 0.4, delay: 1.0, options: [], animations: {
            self.sceneView.alpha = 1.0
        }, completion: nil)
        
        UIView.animate(withDuration: 0.5, delay: 1.4, usingSpringWithDamping: 0.4, initialSpringVelocity: 1.0, options: [], animations: {
            self.alertView.alpha = 1.0
            self.alertView.transform = CGAffineTransform.identity
        }, completion: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        sceneView.session.pause()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if let anchor = detectedDataAnchor {
            sceneView.session.remove(anchor: anchor)
        }
        detectedDataAnchor = nil
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
            
            var rect = barcodeObservation.boundingBox
            rect = rect.applying(CGAffineTransform(scaleX: 1, y: -1))
            rect = rect.applying(CGAffineTransform(translationX: 0, y: 1))
            let center = CGPoint(x: rect.midX, y: rect.midY)
            
            DispatchQueue.main.async {
                self?.process(location: center, at: frame, withType: barcodeValue)
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
    
    private func process(location: CGPoint, at frame: ARFrame, withType type: String) {
        let hitTestResults = frame.hitTest(location, types: [.featurePoint] )
        guard let location = hitTestResults.first else { return }
        
        let rotate = simd_float4x4(SCNMatrix4MakeRotation(sceneView.session.currentFrame!.camera.eulerAngles.y, 0, 1, 0))
        let worldTransform = simd_mul(location.worldTransform, rotate)
        
        if let anchor = self.detectedDataAnchor, let node = self.sceneView.node(for: anchor), detectedDataType == type {
            node.transform = SCNMatrix4(worldTransform)
        } else {
            if let anchor = detectedDataAnchor {
                sceneView.session.remove(anchor: anchor)
            }
            
            detectedDataType = type
            detectedDataAnchor = ARAnchor(transform: worldTransform)
            sceneView.session.add(anchor: detectedDataAnchor!)
        }
    }
}

// -----------------------------------------------------------------------------
// MARK: - ARSCNViewDelegate
// -----------------------------------------------------------------------------

extension Tab3ViewController: ARSCNViewDelegate {
    // MARK: - Base Renderer
    
    internal func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        guard detectedDataAnchor?.identifier == anchor.identifier else { return nil }
        
        let assetName = model[detectedDataType ?? ""]
        
        switch assetName {
        case let name where (name ?? "").hasSuffix(".mov"):
            return rendererVideo(name: (name ?? ""), renderer: renderer, nodeFor: anchor)
        case let name where (name ?? "").count > 0:
            return rendererModel(name: (name ?? ""), renderer: renderer, nodeFor: anchor)
        default:
            return nil
        }
    }
    
    // MARK: - Video
    
    private func rendererVideo(name: String, renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        guard detectedDataAnchor?.identifier == anchor.identifier else { return nil }
        
        let videoNode = SKVideoNode(fileNamed: name)
        videoNode.play()
        
        let skScene = SKScene(size: CGSize(width: 640, height: 480))
        skScene.addChild(videoNode)
        
        videoNode.position = CGPoint(x: skScene.size.width/2, y: skScene.size.height/2)
        videoNode.size = skScene.size
        
        let scale: CGFloat = 0.5
        let tvPlane = SCNPlane(width: 1.0 * scale, height: 0.75 * scale)
        tvPlane.firstMaterial?.diffuse.contents = skScene
        tvPlane.firstMaterial?.isDoubleSided = true
        
        let tvPlaneNode = SCNNode(geometry: tvPlane)
        var translation = matrix_identity_float4x4
        translation.columns.3.z = -1.0
        
        tvPlaneNode.pivot = SCNMatrix4MakeRotation(Float.pi, 1, 0, 0)
        tvPlaneNode.simdTransform = matrix_multiply(anchor.transform, translation)
        tvPlaneNode.eulerAngles = SCNVector3(Double.pi,0,0)
        
        return tvPlaneNode
    }
    
    // MARK: - 3D Model
    
    private func rendererModel(name: String, renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        guard detectedDataAnchor?.identifier == anchor.identifier else { return nil }
        
        let directoryName = "Models.scnassets/" + String(name.split(separator: ".").first ?? "")
        guard let virtualObjectScene = SCNScene(named: name, inDirectory: directoryName) else {
            return nil
        }
        
        let wrapperNode = SCNNode()
        
        for child in virtualObjectScene.rootNode.childNodes {
            child.geometry?.firstMaterial?.lightingModel = .physicallyBased
            child.movabilityHint = .movable
            wrapperNode.addChildNode(child)
        }
        
        wrapperNode.transform = SCNMatrix4(anchor.transform)
        
        return wrapperNode

    }
}
