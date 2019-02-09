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
    var timerLabel: UILabel!
    var timer: Timer!
    var time = 0.0
    
    
    
    func addUIElements(){
        sceneView = SCNView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
       
        self.view.addSubview(sceneView)
        
        controlButton = UIButton(frame: CGRect(x: 20, y: 40, width: 80, height: 40))
        controlButton.backgroundColor = .green
        controlButton.addTarget(self, action:  #selector(begin), for:  .touchUpInside)
        controlButton.setTitle("Start", for: .normal)
        self.view.addSubview(controlButton)
        
        timerLabel = UILabel(frame: CGRect(x: self.view.bounds.width - 80, y: 40, width: 60, height: 40))
        
        timerLabel.text = String(time)
        timerLabel.textColor = .white
        
        self.view.addSubview(timerLabel)
        
    }
    
    @objc
    func begin(){
        controlButton.backgroundColor = .red
        controlButton.setTitle("Stop", for: .normal)
        sharedChoreography.startCoreography()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerRunning), userInfo: nil, repeats: true)
    }
    
    @objc
    func timerRunning() {
        time += 1
        timerLabel.text = String(time)
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
