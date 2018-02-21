//
//  SCNVector.swift
//  RakugakiAR
//
//  Created by 原　圭裕 on 2018/02/14.
//  Copyright © 2018年 原　圭裕. All rights reserved.
//

import Foundation
import SceneKit

infix operator • // ⌥ + 8
infix operator × // かける[変換]

extension SCNVector3{
    static func - (lhs: SCNVector3, rhs: SCNVector3) -> SCNVector3{
        return SCNVector3(lhs.x - rhs.x, lhs.y - rhs.y, lhs.z - rhs.z)
    }
    
    static func + (lhs: SCNVector3, rhs: SCNVector3) -> SCNVector3{
        return SCNVector3(lhs.x + rhs.x, lhs.y + rhs.y, lhs.z + rhs.z)
    }
    
    static func * (lhs: SCNVector3, rhs: CGFloat) -> SCNVector3{
        return SCNVector3(CGFloat(lhs.x) * rhs, CGFloat(lhs.y) * rhs, CGFloat(lhs.z) * rhs)
    }
    
    static func / (lhs: SCNVector3, rhs: CGFloat) -> SCNVector3{
        return SCNVector3(CGFloat(lhs.x) / rhs, CGFloat(lhs.y) / rhs, CGFloat(lhs.z) / rhs)
    }
    
    static func • (lhs: SCNVector3, rhs: SCNVector3) -> CGFloat{
        let x = lhs.x * rhs.x
        let y = lhs.y * rhs.y
        let z = lhs.z * rhs.z
        return CGFloat(x + y + z)
    }
    
    static func × (lhs: SCNVector3, rhs: SCNVector3) -> SCNVector3{
        return SCNVector3(
            (lhs.y*rhs.z) - (lhs.z*rhs.y),
            (lhs.z*rhs.x) - (lhs.x*rhs.z),
            (lhs.x*rhs.y) - (lhs.y*rhs.x)
        )
    }
    
    private var length²: CGFloat{
        let _x = x*x
        let _y = y*y
        let _z = z*z
        return CGFloat(_x + _y + _z)
    }
    
    var length: CGFloat{
        return length².squareRoot()
    }
    
    var normalized: SCNVector3{
        let length = self.length
        return SCNVector3(x: Float(CGFloat(x)/length), y: Float(CGFloat(y)/length), z: Float(CGFloat(z)/length))
    }
}
