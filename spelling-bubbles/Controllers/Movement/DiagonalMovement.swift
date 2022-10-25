//
//  DiagonalMovement.swift
//  joaninos
//
//  Created by alexdamascena on 18/10/22.
//

import UIKit


class DiagonalMovement: Moveable {
        
    var currentLength : Double = 190
    var side: MovementSide = .left
    
    init(toSide side: MovementSide){
        self.side = side
    }
    
    func moving(x: Double) -> Double {
        currentLength -= 1

        if currentLength <= 0 {
            currentLength = 190
        }
        
        if currentLength <= 95 {
            return x  - 0.75 * 0.75 * side.rawValue
        }
        
        return x + 0.75 * 0.75 * side.rawValue
    }
}

