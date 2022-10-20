//
//  VerticalWaveMovement.swift
//  spelling-bubbles
//
//  Created by jpcm2 on 18/10/22.
//

import UIKit


class VerticalWaveMovement {
    var counter: Double = 90
    let side: MovementSide
    
    init(toSide side: MovementSide){
        self.side = side
    }
        
    func moving(y: Double) -> Double {
        counter += 1
        return y + (side.rawValue*sin(counter * Double.pi / 180))/1.5
    }
}
