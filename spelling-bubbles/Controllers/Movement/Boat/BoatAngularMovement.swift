//
//  BoatAngularMovement.swift
//  spelling-bubbles
//
//  Created by Lucas Migge de Barros on 20/10/22.
//

import Foundation


class BoatAngularMovement : Moveable {
    var counter: Double = 90
    let amplitudeModifier = 0.00015
    let side: MovementSide
    
    init(beginTo side: MovementSide){
        self.side = side
    }
    
    func moving(x: Double) -> Double {
        let sinRotation = side.rawValue*sin(counter * Double.pi / 180)
        counter += 3
        
        return x + (sinRotation * amplitudeModifier)
    }
}
