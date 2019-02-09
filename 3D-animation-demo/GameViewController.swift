//
//  GameViewController.swift
//  3D-animation-demo
//
//  Created by Henry Boswell on 2/7/19.
//  Copyright © 2019 Henry Boswell. All rights reserved.
//

import UIKit
import QuartzCore
import SceneKit


let sharedWorld = World()
let sharedChoreography = Choreography()

class GameViewController: UIViewController {

    var sceneView: SCNView!
    var controlButton: UIButton!
    
    
    func addUIElements(){
        controlButton = UIButton(frame: CGRect(x: 20, y: 40, width: 80, height: 40))
        controlButton.backgroundColor = .red
        
        controlButton.addTarget(self, action:  #selector(begin), for:  .touchUpInside)
        sceneView = SCNView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        sceneView.debugOptions = .showPhysicsShapes
        self.view.addSubview(sceneView)
        self.view.addSubview(controlButton)
    }
    
    @objc func begin(){
        
        sharedChoreography.startCoreography()
    }
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        addUIElements()
        sharedWorld.initScene(view: sceneView)
        sharedWorld.initFloor()
        sharedWorld.init3DObjects()
        sharedWorld.initPhysics()
        
        sharedChoreography.initialPosition()
        
       
        
        
        
        
       
        
       
    }
        
    

}
