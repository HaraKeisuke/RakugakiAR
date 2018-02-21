//
//  Brush.swift
//  RakugakiAR
//
//  Created by 原　圭裕 on 2018/02/18.
//  Copyright © 2018年 原　圭裕. All rights reserved.
//

import Foundation
import SceneKit

class Brush {
    var path: SCNPath = SCNPath()
    var geometry: SCNGeometry? = nil
    
    init() {
        
    }
    
    func start(from: SCNVector3){
        _ = path.start(from: from)
    }
    
    func updatePath(position: SCNVector3){
        _ = path.addLine(to: position)
        reload()
    }
    
    func reload(){
        let verticles = self.verticles()
        let source = SCNGeometrySource(vertices: verticles)
        let element = SCNGeometryElement(indices: indices(verticles: verticles), primitiveType: .line)
        geometry = SCNGeometry(sources: [source], elements: [element])
        geometry!.insertMaterial(material(), at: 0)
    }
    
    private func verticles() -> [SCNVector3] {
        var _verticles : [SCNVector3] = Array<SCNVector3>()
        
        let points = path.points
        
        if points.isEmpty {
            return Array<SCNVector3>()
        }
        
        for (index, point) in (points.enumerated()) {
            if((index < (points.count)-1)){
                if(index > 0 && self.compareDistance(x: points[index - 1], y: point)){
                    _verticles.append(point)
//                    _verticles.append(point + SCNVector3(0.001, 0.001, 0.001))
//                    _verticles.append(point + SCNVector3(-0.001, 0.001, 0.001))
//                    _verticles.append(point + SCNVector3(-0.001, -0.001, 0.001))
//                    _verticles.append(point + SCNVector3(0.001, -0.001, 0.001))
//                    _verticles.append(point + SCNVector3(0.001, -0.001, -0.001))
//                    _verticles.append(point + SCNVector3(0.001, 0.001, -0.001))
//                    _verticles.append(point + SCNVector3(-0.001, 0.001, -0.001))
//                    _verticles.append(point + SCNVector3(-0.001, -0.001, -0.001))
                }
            }
        }
        return _verticles
    }
    
    
    private func indices(verticles: [SCNVector3]) -> [UInt32] {
        var rtn = [UInt32]();
        
        guard verticles.count > 2 else {
            return rtn
        }
        
        for i in 0..<(verticles.count)-1{
            if i < verticles.count-3 {
                rtn += [UInt32(i), UInt32(i+1), UInt32(i+2)]
            }
            
            if i < verticles.count-4 {
                rtn += [UInt32(i), UInt32(i+2), UInt32(i+3)]
            }
            
            if i < verticles.count-5 {
                rtn += [UInt32(i), UInt32(i+3), UInt32(i+4)]
            }
            
            

            
//          rtn += [UInt32(i), UInt32(i+2)]
//          rtn += [UInt32(i), UInt32(i+3)]
        };
        return rtn
    }

    
    func material() -> SCNMaterial {
        let material = SCNMaterial()
        material.diffuse.contents = UIColor.white.cgColor
        return material
    }
    
    
    
    
    func compareDistance(x: SCNVector3, y: SCNVector3) -> Bool {
        var d = simd_distance(double3(x), double3(y))
        if d > 0.001 || d == 0 {
            return false
        }
        return true
    }
}
