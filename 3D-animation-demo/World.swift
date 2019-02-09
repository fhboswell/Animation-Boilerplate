//
//  WorldSetup.swift
//  3D-animation-demo
//
//  Created by Henry Boswell on 2/7/19.
//  Copyright © 2019 Henry Boswell. All rights reserved.
//

import Foundation
import UIKit
import QuartzCore
import SceneKit


class World{
    
    // MARK: - Properties
    var car1 :SCNNode!
    var car2 :SCNNode!
    var car3 :SCNNode!
    var bike :SCNNode!
    let scene = SCNScene()
    
    var chassis : SCNNode!
    var wheel0 : SCNNode!
    var wheel1 : SCNNode!
    var wheel2 : SCNNode!
    var wheel3 : SCNNode!
    
    func initScene(view: UIView){
        
        
        // create and add a camera to the scene
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        scene.rootNode.addChildNode(cameraNode)
        
        // place the camera
        cameraNode.position = SCNVector3(x: 10, y: 10, z: 60)
        cameraNode.rotation = SCNVector4(x:-1, y:1, z:0, w: .pi/6)
        
        // create and add a light to the scene
        let lightNode = SCNNode()
        lightNode.light = SCNLight()
        lightNode.light!.type = .omni
        lightNode.position = SCNVector3(x: 0, y: 10, z: 10)
        scene.rootNode.addChildNode(lightNode)
        
        // create and add an ambient light to the scene
        let ambientLightNode = SCNNode()
        ambientLightNode.light = SCNLight()
        ambientLightNode.light!.type = .ambient
        ambientLightNode.light!.color = UIColor.darkGray
        scene.rootNode.addChildNode(ambientLightNode)
        
        //ship.runAction(SCNAction.repeatForever(SCNAction.rotateBy(x: 1, y: 0, z: 0.5, duration: 0.1)))
        
        // retrieve the SCNView
        let scnView = view as! SCNView
        
        // set the scene to the view
        scnView.scene = scene
        
        // allows the user to manipulate the camera
        scnView.allowsCameraControl = true
        
        // show statistics such as fps and timing information
        scnView.showsStatistics = true
        
        // configure the view
        scnView.backgroundColor = UIColor.black
        
     
    }
    
    func initFloor(){
        
        var floorGeometry = SCNBox(width: 20, height: 0.1, length: 20, chamferRadius: 0)
        let floor = SCNNode(geometry: floorGeometry)
        
        floor.geometry = floorGeometry
        floor.geometry!.firstMaterial!.diffuse.contents = "fourway.png"

        floor.geometry!.firstMaterial!.diffuse.contentsTransform = SCNMatrix4MakeScale(1, 1, 0) //scale the wood texture
        floor.geometry!.firstMaterial!.locksAmbientWithDiffuse = true
       
        
        floor.physicsBody = SCNPhysicsBody.static()
        floor.physicsBody?.allowsResting = true
        floor.physicsBody?.restitution = 0.5
        floor.physicsBody?.friction = 0
        floor.categoryBitMask = 2
        scene.rootNode.addChildNode(floor)
        
        var floor2Geometry = SCNBox(width: 20, height: 0.1, length: 40, chamferRadius: 0)
        let floor2 = SCNNode(geometry: floor2Geometry)
        
        floor2.geometry = floor2Geometry
        floor2.geometry!.firstMaterial!.diffuse.contents = "road.png"
        
        floor2.geometry!.firstMaterial!.diffuse.contentsTransform = SCNMatrix4MakeScale(1, 1, 0) //scale the wood texture
        floor2.geometry!.firstMaterial!.locksAmbientWithDiffuse = true
        
        
        floor2.physicsBody = SCNPhysicsBody.static()
        floor2.physicsBody?.allowsResting = true
        floor2.physicsBody?.restitution = 0.5
        floor2.physicsBody?.friction = 0
        floor2.categoryBitMask = 2
        
        scene.rootNode.addChildNode(floor2)
        floor2.position = SCNVector3(x:0, y:0, z:29)
        
    }
   
    
    func init3DObjects(){
        
        var carGeometry = SCNBox(width: 1.0, height: 1.0, length: 3.0, chamferRadius: 0.0)
        
        var bikeGeometry = SCNBox(width: 0.5, height: 1.0, length: 1.0, chamferRadius: 0.0)
        
        car1 = SCNNode(geometry: carGeometry)
        car2 = SCNNode(geometry: carGeometry)
        car3 = SCNNode(geometry: carGeometry)
        bike = SCNNode(geometry: bikeGeometry)
        
        
        scene.rootNode.addChildNode(car1)
        scene.rootNode.addChildNode(car2)
        scene.rootNode.addChildNode(car3)
        scene.rootNode.addChildNode(bike)
       
    }
    
    func initPhysics(){
        sharedWorld.car1.physicsBody = SCNPhysicsBody(type: .dynamic, shape: nil)
        //sharedWorld.car1.physicsBody?.isAffectedByGravity = true
        sharedWorld.car1.physicsBody?.damping = 0
        sharedWorld.car1.physicsBody?.friction = 0
        
        
        
        sharedWorld.car2.physicsBody = SCNPhysicsBody(type: .dynamic, shape: nil)
        //sharedWorld.car2.physicsBody?.isAffectedByGravity = true
        sharedWorld.car2.physicsBody?.damping = 0
        sharedWorld.car2.physicsBody?.friction = 0
        
        sharedWorld.car3.physicsBody = SCNPhysicsBody(type: .dynamic, shape: nil)
        //sharedWorld.car3.physicsBody?.isAffectedByGravity = true
        sharedWorld.car3.physicsBody?.damping = 0
        sharedWorld.car3.physicsBody?.friction = 0
        
        sharedWorld.bike.physicsBody = SCNPhysicsBody(type: .dynamic, shape: nil)
        //sharedWorld.bike.physicsBody?.isAffectedByGravity = true
        sharedWorld.bike.physicsBody?.damping = 0
        sharedWorld.bike.physicsBody?.friction = 0
        
    }
    
}
