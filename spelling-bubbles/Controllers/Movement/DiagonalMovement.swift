//
//  DiagonalMovement.swift
//  joaninos
//
//  Created by alexdamascena on 18/10/22.
//

import UIKit


class DiagonalMovement: Moveable {
    
    struct Constants {
        static let MAX_LENGTH_MOVEMENT: Double = 50
        static let RIGHT_CORNER = Double(UIScreen.main.bounds.width)
        static let LEFT_CORNER = 0
    }
    
    var current_length: Double = 0
    var side: MovementSide = .left
    
    func moving(x: Double) -> Double {
        current_length += 2
        side = (x + current_length <= Constants.MAX_LENGTH_MOVEMENT) ? .left : .right
        return x + current_length * side.rawValue
    }
}

