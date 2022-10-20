//
//  WaveMovement.swift
//  joaninos
//
//  Created by alexdamascena on 18/10/22.
//

import Foundation
import UIKit

class WaveMovement: Moveable {
    
    var counter: Double = 90
    let side: MovementSide
    
    init(toSide side: MovementSide){
        self.side = side
    }
        
    func moving(x: Double) -> Double {
        if(x == 0 || x == Double(UIScreen.main.bounds.width)){
            return x
        }
        counter += 1
        return x + side.rawValue*sin(counter * Double.pi / 180)
    }
}

