//
//  File.swift
//  RakugakiAR
//
//  Created by 原　圭裕 on 2018/02/22.
//  Copyright © 2018年 原　圭裕. All rights reserved.
//

import SceneKit

extension CGPoint {
    
    static func - (lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        return CGPoint(x: lhs.x - rhs.x, y: lhs.y - rhs.y)
    }
    
    static func + (lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        return CGPoint(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
    }
    
    static func * (lhs: CGPoint, rhs: CGFloat) -> CGPoint {
        return CGPoint(x: lhs.x * rhs, y: lhs.y * rhs)
    }
    
    static func / (lhs: CGPoint, rhs: CGFloat) -> CGPoint {
        return CGPoint(x: lhs.x / rhs, y: lhs.y / rhs)
    }
    
    static func * (lhs: CGPoint, rhs: CGPoint) -> CGFloat { // dot product
        return lhs.x * rhs.x + lhs.y * rhs.y
    }
    
    
    static func × (lhs: CGPoint, rhs: CGPoint) -> CGFloat { // cross product
        return lhs.x * rhs.y - lhs.y * rhs.x
    }
    
    var length²: CGFloat {
        return (x * x) + (y * y)
    }
    
    var length: CGFloat {
        return sqrt(self.length²)
    }
    
    var normalized: CGPoint {
        let length = self.length
        return CGPoint(x: x/length, y: y/length)
    }
    
}
