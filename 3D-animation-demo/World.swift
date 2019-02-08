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


class WorldSetup {
    
    // MARK: - Properties
    var car1 :SCNNode!
    var car2 :SCNNode!
    var car3 :SCNNode!
    var bike :SCNNode!
    
    func init3DObjects(scene: SCNScene){
        
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
    
}
