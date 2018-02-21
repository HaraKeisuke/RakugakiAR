////
////  SCNLike.swift
////  RakugakiAR
////
////  Created by 原　圭裕 on 2018/02/18.
////  Copyright © 2018年 原　圭裕. All rights reserved.
////
//
//import Foundation
//import SceneKit
//
//class SCNLine: SCNNode{
//    
//    
//    override init(){
//        super.init()
//    }
//    
//    // Pathを指定してBezier曲線を引く
//    init(path: SCNPath){
//        super.init()
////        self.geometry = Brush(path: path).geometry
//    }
//    
//    init(from : SCNVector3, to : SCNVector3){
//        super.init()
//        let source = SCNGeometrySource.init(vertices: [from, to])
//        let indices : [UInt8] = [0, 1]
//        let data = Data.init(bytes: indices)
//        let element = SCNGeometryElement.init(data: data, primitiveType: .line, primitiveCount: 1, bytesPerIndex: 1)
//        
//        let geometry = SCNGeometry.init(sources: [source], elements: [element])
//        //        super.init(geometry: geometry)
//        self.geometry = geometry
//        
//        let material = SCNMaterial.init()
//        material.diffuse.contents = UIColor.white.cgColor
//        self.geometry!.insertMaterial(material, at: 0)
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError()
//    }
//}

