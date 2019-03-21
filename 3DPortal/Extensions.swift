//
//  Extensions.swift
//  3DPortal
//
//  Created by Mac Mini Novo on 21/03/19.
//  Copyright © 2019 LiuVasconcelos. All rights reserved.
//

import Foundation
import SceneKit
import ARKit

var width: CGFloat  = 0.03
var height: CGFloat = 1.0
var lenght: CGFloat = 1.0

var doorLength: CGFloat = 0.3

func createBox(isDoor: Bool) -> SCNNode {
    let node = SCNNode()
    
    //Add first box
    let firstBox = SCNBox(width: width, height: height, length: isDoor ? doorLength : lenght, chamferRadius: 0)
    firstBox.firstMaterial?.diffuse.contents = UIColor.white
    let firstBoxNode = SCNNode(geometry: firstBox)
    firstBoxNode.renderingOrder = 200
    node.addChildNode(firstBoxNode)

    //Add masked box
    let maskedBox = SCNBox(width: width, height: height, length: isDoor ? doorLength : lenght, chamferRadius: 0)
    maskedBox.firstMaterial?.diffuse.contents = UIColor.white
    maskedBox.firstMaterial?.transparency = 0.000000001
    
    let maskedBoxNode = SCNNode(geometry: maskedBox)
    maskedBoxNode.renderingOrder = 100
    maskedBoxNode.position = SCNVector3.init(width, 0, 0)
    node.addChildNode(maskedBoxNode)
    
    return node
}

extension FloatingPoint {
    var degreesToRadians: Self {
        return self * .pi / 180
    }
    
    var radiansToDegrees: Self {
        return self * 180 / .pi
    }
}
