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
        cameraNode.position = SCNVector3(x: 0, y: 5, z: 10)
        cameraNode.rotation = SCNVector4(x:-1, y:0, z:0, w: .pi/6)
        
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
        
        var floorGeometry = SCNBox(width: 100, height: 1, length: 100, chamferRadius: 0)
        let floor = SCNNode(geometry: floorGeometry)
        
//        floor.geometry = floorGeometry
//        floor.geometry!.firstMaterial!.diffuse.contents = "concrete.png"
//
//        floor.geometry!.firstMaterial!.diffuse.contentsTransform = SCNMatrix4MakeScale(2, 2, 1) //scale the wood texture
//        floor.geometry!.firstMaterial!.locksAmbientWithDiffuse = true
       
        
        floor.physicsBody = SCNPhysicsBody.static()
        floor.physicsBody?.allowsResting = true
        floor.physicsBody?.restitution = 0.5
        floor.categoryBitMask = 2
        scene.rootNode.addChildNode(floor)
        
    }
    
    func initVehicleNodes(){
        var chassisGeometry = SCNBox(width: 1.0, height: 1.0, length: 2.0, chamferRadius: 0.0)
        var wheelGeometry = SCNCylinder(radius: 0.5, height: 0.5)
       
        
        chassis = SCNNode(geometry: chassisGeometry)
       
        
        wheel0 = SCNNode(geometry: wheelGeometry)
        wheel1 = SCNNode(geometry: wheelGeometry)
        wheel2 = SCNNode(geometry: wheelGeometry)
        wheel3 = SCNNode(geometry: wheelGeometry)
        
        wheel0.categoryBitMask = 2
        wheel1.categoryBitMask = 2
        wheel2.categoryBitMask = 2
        wheel3.categoryBitMask = 2
        
        wheel1.physicsBody = SCNPhysicsBody.dynamic()
        
        
        
        chassis.addChildNode(wheel0)
        chassis.addChildNode(wheel1)
        chassis.addChildNode(wheel2)
        chassis.addChildNode(wheel3)
        wheel0.position = SCNVector3(x: -1, y: -0.5, z: 1)
        wheel1.position = SCNVector3(x: -1, y: -0.5, z: -1)
        wheel2.position = SCNVector3(x: 1, y: -0.5, z: -1)
        wheel3.position = SCNVector3(x: 1, y: -0.5, z: 1)
        scene.rootNode.addChildNode(chassis)
        
        chassis.position = SCNVector3(x: 0, y: 10, z: 0)
       
    }
        
    func initVehiclePhysics(){
        

        let body = SCNPhysicsBody.dynamic()
        body.allowsResting = false
        body.mass = 8
        body.restitution = 0.5
        body.friction = 0.5
        body.rollingFriction = 0

        chassis.physicsBody = body
      


        //add wheels
        
        let _wheel0 = SCNPhysicsVehicleWheel(node: wheel0)
        let _wheel1 = SCNPhysicsVehicleWheel(node: wheel1)
        let _wheel2 = SCNPhysicsVehicleWheel(node: wheel2)
        let _wheel3 = SCNPhysicsVehicleWheel(node: wheel3)
        
        _wheel0.connectionPosition = wheel0.position
        _wheel1.connectionPosition = wheel1.position
        _wheel2.connectionPosition = wheel2.position
        _wheel3.connectionPosition = wheel3.position
        
        _wheel0.axle = SCNVector3(x: 0, y: 0, z: 1)
        _wheel1.axle = SCNVector3(x: 0, y: 0, z: 1)
        _wheel2.axle = SCNVector3(x: 0, y: 0, z: 1)
        _wheel3.axle = SCNVector3(x: 0, y: 0, z: 1)
        
        _wheel0.maximumSuspensionTravel = 10
        _wheel1.maximumSuspensionTravel = 10
        _wheel2.maximumSuspensionTravel = 10
        _wheel3.maximumSuspensionTravel = 10
        
    

        let (min, max) = wheel0.boundingBox
        let wheelHalfWidth = Float(0.5 * (max.x - min.x))

        

        // create the physics vehicle
        let vehicle = SCNPhysicsVehicle(chassisBody: chassis!.physicsBody!, wheels: [_wheel0, _wheel1, _wheel2, _wheel3])
        scene.physicsWorld.addBehavior(vehicle)

       
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
        sharedWorld.car1.physicsBody?.isAffectedByGravity = false
        sharedWorld.car1.physicsBody?.damping = 0
        
        
        sharedWorld.car2.physicsBody = SCNPhysicsBody(type: .dynamic, shape: nil)
        sharedWorld.car2.physicsBody?.isAffectedByGravity = false
        sharedWorld.car2.physicsBody?.damping = 0
        
        sharedWorld.car3.physicsBody = SCNPhysicsBody(type: .dynamic, shape: nil)
        sharedWorld.car3.physicsBody?.isAffectedByGravity = false
        sharedWorld.car3.physicsBody?.damping = 0
        
        sharedWorld.bike.physicsBody = SCNPhysicsBody(type: .dynamic, shape: nil)
        sharedWorld.bike.physicsBody?.isAffectedByGravity = false
        sharedWorld.bike.physicsBody?.damping = 0
    }
    
}
