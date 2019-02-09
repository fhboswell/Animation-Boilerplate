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
        sharedWorld.car1.position = SCNVector3(x:0, y:0, z: 30)
        sharedWorld.car2.position = SCNVector3(x:0, y: 0, z: 35)
        sharedWorld.car3.position = SCNVector3(x:0, y: 0, z: 40)
        sharedWorld.bike.position = SCNVector3(x:2, y:0, z: 39)
    }
    func startCoreography(){
        
        
        
        
        
        // animate the 3d object
        //ship.runAction(SCNAction.repeatForever(SCNAction.move(by: SCNVector3(x:0, y:0, z: 0.1), duration: 0.1)))
        
//       runAction(SCNAction.repeatForever(SCNAction.move(by: SCNVector3(x:0, y:0, z: -0.3), duration: 0.1))
//        sharedWorld.car2.runAction(SCNAction.repeatForever(SCNAction.move(by: SCNVector3(x:0, y:0, z: -0.1), duration: 0.1)))
//        sharedWorld.car3.runAction(SCNAction.repeatForever(SCNAction.move(by: SCNVector3(x:0, y:0, z: -0.1), duration: 0.1)))
//        sharedWorld.bike.runAction(SCNAction.repeatForever(SCNAction.move(by: SCNVector3(x:0, y:0, z: -0.3), duration: 0.1)))
        
       
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.start()
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.start()
        }
    }
    func start(){
        sharedWorld.car1.physicsBody?.applyForce(SCNVector3(x:0, y:0, z: -4), asImpulse: true)
        sharedWorld.car2.physicsBody?.applyForce(SCNVector3(x:0, y:0, z: -4), asImpulse: true)
        sharedWorld.car3.physicsBody?.applyForce(SCNVector3(x:0, y:0, z: -4), asImpulse: true)
        sharedWorld.bike.physicsBody?.applyForce(SCNVector3(x:0, y:0, z: -7), asImpulse: true)
    }
    
    func spin(){
        
      //  sharedWorld.car3.sharedWorld.car3.rotate(by: SCNQuaternion(x:0,y:1,z:0,w:.pi/4), aroundTarget: SCNVector3(x:1, y:1, z: 1))
      //  runAction(SCNAction.repeatForever(SCNAction.move(by: SCNVector3(x:0, y:0, z: -0.3), duration: 0.1))
        sharedWorld.car3.runAction( SCNAction.rotate(by: .pi/6, around: SCNVector3(x:1, y:1, z: 0), duration: 1))
        SCNAction.rotate(by: .pi/6, around: SCNVector3(x:1, y:1, z: 0), duration: 1)
        //((SCNVector3(x:0, y:0, z: -7), at: SCNVector3(x:1, y:0, z: 0), asImpulse: true))
        
        
    }

}
