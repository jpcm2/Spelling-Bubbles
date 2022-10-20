//
//  BoatHorizontalMovement.swift
//  spelling-bubbles
//
//  Created by Lucas Migge de Barros on 20/10/22.
//

import Foundation


class BoatHorizontalMovement : Moveable {
    
    var counter: Double = 90
    let side: MovementSide
    
    init(beginTo side: MovementSide){
        self.side = side
    }

    func moving(x: Double) -> Double {
        let amplitudeModifier = 0.1
        let sinRotation = side.rawValue*sin(counter * Double.pi / 180)
        counter += 0.15
        
        return x + (sinRotation * amplitudeModifier)
    }
}
