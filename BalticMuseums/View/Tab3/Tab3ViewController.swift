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
    
    var detectedDataAnchor: ARAnchor?
    var isProcessing = false
    var node: SCNNode? = nil
    var videoPlayer: AVPlayer = {
        let videoUrl = Bundle.main.url(forResource: "movie", withExtension: "mov")!
        return AVPlayer(url: videoUrl)
    }()
    
    // MARK: - View Controller Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        let spriteKitScene = SKScene(size: CGSize(width: 100, height: 100))
        spriteKitScene.scaleMode = .aspectFit
        
        let videoSpriteKitNode = SKVideoNode(avPlayer: videoPlayer)
        videoSpriteKitNode.position = CGPoint(x: spriteKitScene.size.width / 2.0, y: spriteKitScene.size.height / 2.0)
        videoSpriteKitNode.size = spriteKitScene.size
        videoSpriteKitNode.yScale = -1.0
        videoSpriteKitNode.play()
        spriteKitScene.addChild(videoSpriteKitNode)
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(Tab3ViewController.playerItemDidReachEnd),
            name: NSNotification.Name.AVPlayerItemDidPlayToEndTime,
            object: videoPlayer.currentItem)
                
        // Create a SceneKit plane and add the SpriteKit scene as its material
        let background = SCNPlane(width: CGFloat(0.2), height: CGFloat(0.2))
        background.firstMaterial?.diffuse.contents = spriteKitScene
        background.firstMaterial?.diffuse.wrapS = .clamp
        background.firstMaterial?.diffuse.wrapT = .clamp
        node = SCNNode(geometry: background)
        
        
        
        sceneView.delegate = self
        sceneView.session.delegate = self
        sceneView.showsStatistics = true
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
        guard detectedDataAnchor?.identifier == anchor.identifier else { return nil }
        
//        // Create a 3D Cup to display
//        guard let virtualObjectScene = SCNScene(named: "cup.scn", inDirectory: "Models.scnassets/cup") else {
//            return nil
//        }
        
//        let test = UIView()
//        test.backgroundColor = .red
        
//        let plane = SCNPlane(width: 1.0, height: 0.75)
//        plane.firstMaterial?.diffuse.contents = planeView
//        plane.firstMaterial?.isDoubleSided = true
//
//        let wrapperNode = SCNNode(geometry: plane)
        
        node?.transform = SCNMatrix4(anchor.transform)
//
        return node
        
//        return nil
    }
}
