//
//  SCNPath.swift
//  RakugakiAR
//
//  Created by 原　圭裕 on 2018/02/18.
//  Copyright © 2018年 原　圭裕. All rights reserved.
//

import Foundation
import SceneKit

class SCNPath{
    
    private var current: SCNVector3 = SCNVector3(0, 0, 0)
    var points: [SCNVector3] = [] //曲線を構成する点の座標を保存する
    
    /// 始点を設定します。pointsは上書きされます。デフォルトでは(0, 0, 0)です。
    func start(from point: SCNVector3) -> SCNPath{
        current = point
        points = [point]
        return self
    }
    
    func removeItem(index: Int){
        points.remove(at: index)
    }
    
    func addLine(to point: SCNVector3) -> SCNPath{
        var rtn = [SCNVector3]()
        points.append(current)
        rtn.append(current)
        current = point
        return self
    }
    
    func addQuadCurve(to point: SCNVector3, control: SCNVector3) -> SCNPath{
        var rtn = [SCNVector3]()
        let n = Int((control - current).length + (point - control).length) * 12 //この係数を変えると、カクカク度と計算量が反比例して変化する。
        for i in 0..<n{
            let t = CGFloat(i) / CGFloat(n)
            
            let q1 = current + (control - current) * t
            let q2 = control + (point - control) * t
            
            let r = q1 + (q2 - q1) * t
            rtn.append(r)
        }
        points += rtn
        current = point
        return self
    }
    
    func addCurve(to point: SCNVector3, control1: SCNVector3, control2: SCNVector3) -> SCNPath{
        var rtn = [SCNVector3]()
        let n = Int((control1 - current).length + (control2 - control1).length + (point - control2).length) * 12 //この係数を変えると、カクカク度と計算量が反比例して変化する。
        for i in 0..<n{
            let t = CGFloat(i) / CGFloat(n)
            
            let q1 = current + (control1 - current) * t
            let q2 = control1 + (control2 - control1) * t
            let q3 = control2 + (point - control2) * t
            
            let r1 = q1 + (q2 - q1) * t
            let r2 = q2 + (q3 - q2) * t
            
            let s = r1 + (r2 - r1) * t
            rtn.append(s)
        }
        points += rtn
        current = point
        return self
    }
    
    func end(){
        points.append(current)
    }
    
    func close() -> SCNPath{
        _ = addLine(to: self.points[0])
        if let last = points.last, last == current{}else{
            points.append(current)
        }
        current = self.points[0]
        return self
    }
}

extension SCNVector3: Equatable{
    public static func == (lhs: SCNVector3, rhs: SCNVector3) -> Bool{
        return (lhs.x == rhs.x) && (lhs.y == rhs.y) && (lhs.z == rhs.z)
    }
}
