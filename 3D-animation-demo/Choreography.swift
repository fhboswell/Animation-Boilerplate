//
//  Choreography.swift
//  3D-animation-demo
//
//  Created by Henry Boswell on 2/7/19.
//  Copyright © 2019 Henry Boswell. All rights reserved.
//

import Foundation

import UIKit
import QuartzCore
import SceneKit

class Choreography{
    
    
    
    func initialPosition(){
        sharedWorld.car1.position = SCNVector3(x:0, y:0, z: 0)
        sharedWorld.car2.position = SCNVector3(x:0, y: 0, z: 5)
        sharedWorld.car3.position = SCNVector3(x:0, y: 0, z: 10)
        sharedWorld.bike.position = SCNVector3(x:2, y:0, z: 9)
    }
    func startCoreography(){
        
        
        
        
        
        // animate the 3d object
        //ship.runAction(SCNAction.repeatForever(SCNAction.move(by: SCNVector3(x:0, y:0, z: 0.1), duration: 0.1)))
        
//        //car1.runAction(SCNAction.repeatForever(SCNAction.move(by: SCNVector3(x:0, y:0, z: -0.1), duration: 0.1)))
//        sharedWorld.car2.runAction(SCNAction.repeatForever(SCNAction.move(by: SCNVector3(x:0, y:0, z: -0.1), duration: 0.1)))
//        sharedWorld.car3.runAction(SCNAction.repeatForever(SCNAction.move(by: SCNVector3(x:0, y:0, z: -0.1), duration: 0.1)))
//        sharedWorld.bike.runAction(SCNAction.repeatForever(SCNAction.move(by: SCNVector3(x:0, y:0, z: -0.3), duration: 0.1)))
        
        sharedWorld.car1.physicsBody?.applyForce(SCNVector3(x:0, y:0, z: -1), asImpulse: true)
        sharedWorld.car2.physicsBody?.applyForce(SCNVector3(x:0, y:0, z: -1), asImpulse: true)
        sharedWorld.car3.physicsBody?.applyForce(SCNVector3(x:0, y:0, z: -1), asImpulse: true)
        sharedWorld.bike.physicsBody?.applyForce(SCNVector3(x:0, y:0, z: -2), asImpulse: true)
    }

}
