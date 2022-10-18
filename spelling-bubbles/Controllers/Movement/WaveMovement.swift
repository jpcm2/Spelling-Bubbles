//
//  WaveMovement.swift
//  joaninos
//
//  Created by alexdamascena on 18/10/22.
//

import Foundation

class WaveMovement: Moveable {
    
    var counter: Double = 90
    let side: MovementSide
    
    init(toSide side: MovementSide){
        self.side = side
    }
        
    func moving(x: Double) -> Double {
        counter += 1
        return x + side.rawValue*sin(counter * Double.pi / 180)
    }
}

