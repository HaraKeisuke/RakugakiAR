//
//  CPoint.swift
//  RakugakiAR
//
//  Created by 原　圭裕 on 2018/02/22.
//  Copyright © 2018年 原　圭裕. All rights reserved.
//

import SceneKit

class CPoint: Hashable {
    var point: CGPoint
    
    var x: CGFloat { return point.x }
    var y: CGFloat { return point.y }
    
    init(_ point: CGPoint) {
        self.point = point
    }
    
    init(x: CGFloat, y: CGFloat) {
        self.point = CGPoint(x: x, y: y)
    }
    
    var hashValue: Int { return self.x.hashValue &- self.y.hashValue }
    
    static func == (lhs: CPoint, rhs: CPoint) -> Bool { // same value points should be different
        return lhs === rhs
    }
}
