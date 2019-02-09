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

        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.start()
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.spin()
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.cameraChange()
        }
    }
    func start(){
        sharedWorld.car1.physicsBody?.applyForce(SCNVector3(x:0, y:0, z: -4), asImpulse: true)
        sharedWorld.car2.physicsBody?.applyForce(SCNVector3(x:0, y:0, z: -4), asImpulse: true)
        sharedWorld.car3.physicsBody?.applyForce(SCNVector3(x:0, y:0, z: -4), asImpulse: true)
        sharedWorld.bike.physicsBody?.applyForce(SCNVector3(x:0, y:0, z: -7), asImpulse: true)
    }
    
    func spin(){
  
        //sharedWorld.car3.physicsBody?.applyTorque(SCNVector4(x:0,y:1,z:0,w:.pi/4), asImpulse: true)
    
    }
    func cameraChange(){
        sharedWorld.cameraNode.runAction( SCNAction.rotate(by: .pi/2, around: SCNVector3(x:0, y:1, z: 0), duration: 12))
        sharedWorld.cameraNode.runAction( SCNAction.move(by: SCNVector3(x:20, y:1, z: -60), duration: 12))
    }

}
