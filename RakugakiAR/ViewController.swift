//
//  ViewController.swift
//  RakugakiAR
//
//  Created by 原　圭裕 on 2018/02/14.
//  Copyright © 2018年 原　圭裕. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    var path : SCNPath = SCNPath()
    var brush :Brush = Brush()
    var lineNode : SCNNode = SCNNode()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        sceneView.debugOptions = ARSCNDebugOptions.showFeaturePoints
        
        
        // Create a new scene
        let scene = SCNScene()
        
        sceneView.scene.rootNode.addChildNode(lineNode)
        
        let gesture = UILongPressGestureRecognizer(target: self, action: #selector(tapView))
        sceneView.addGestureRecognizer(gesture)
        
        // Set the scene to the view
        sceneView.scene = scene
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        let configuration = ARWorldTrackingConfiguration()
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
    
    @objc func tapView(sender: UILongPressGestureRecognizer){
        
        guard let camera = sceneView.pointOfView else {
            return
        }

        let position = SCNVector3(x: 0, y: 0, z: -0.05) // 偏差のベクトルを生成する
        let convertPosition = camera.convertPosition(position, to: nil)

        switch sender.state {
        case .began:
            print("ドラッグ開始")
            brush.start(from: convertPosition)
        case .ended:
            print("ドラッグ終了")
        default:
            brush.updatePath(position: convertPosition)
            lineNode.geometry = brush.geometry
            lineNode.removeFromParentNode()
            sceneView.scene.rootNode.addChildNode(lineNode)
        }
    }
    
//    private func updateLine(){
////        lineNode = SCNLine(path: path)
////        lineNode?.removeFromParentNode()
//        lineNode.geometry = brush
//    }
}
