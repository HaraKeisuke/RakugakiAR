//
//  ARCameraExtention.swift
//  RakugakiAR
//
//  Created by 原　圭裕 on 2018/02/18.
//  Copyright © 2018年 原　圭裕. All rights reserved.
//

import Foundation
import ARKit
import SceneKit

extension ARCamera {
    func calculateCameraDirection() -> SCNVector3 {
        let yaw = self.eulerAngles.y
        let pitch = self.eulerAngles.x
        
        let x = cos(yaw)*cos(pitch)
        let y = sin(yaw)*cos(pitch)
        let z = sin(pitch)
        
        return SCNVector3Make(x, y, z)
    }
}

