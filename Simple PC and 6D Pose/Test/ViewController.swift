//
//  ViewController.swift
//  Test
//
//  Created by Tanmay Desai on 4/25/23.
//

import UIKit
import ARKit
import SceneKit

class ViewController: UIViewController, ARSCNViewDelegate, ARSessionDelegate {
    
    @IBOutlet var sceneView: ARSCNView!
   

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        sceneView.delegate = self
        sceneView.session.delegate = self
        sceneView.showsStatistics = true
        
        let configuration = ARWorldTrackingConfiguration()
        
        if ARWorldTrackingConfiguration.supportsSceneReconstruction(.meshWithClassification){
            configuration.sceneReconstruction = .meshWithClassification
            configuration.environmentTexturing = .automatic
            configuration.isLightEstimationEnabled = true
        }
        
        sceneView.session.run(configuration)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        sceneView.session.pause()
    }

    //ARSCNViewDelegate
    func session(_ session: ARSession, didUpdate frame: ARFrame){
        let cameraTransform = frame.camera.transform
        let cameraPose = simd_mul(cameraTransform,float4x4(diagonal: SIMD4(1,1,1,1)))
        
        print("Camera 6D Pose:")
        print(cameraPose)
        
        if let pointCloud = frame.rawFeaturePoints{
            print("3D Point Cloud:")
            let points = pointCloud.points
            
            for index in stride (from: 0, to: points.count, by: 4){
                let point = points[index]
                print("Point \(index/4):\(point)")
            }
        }
    }
}

