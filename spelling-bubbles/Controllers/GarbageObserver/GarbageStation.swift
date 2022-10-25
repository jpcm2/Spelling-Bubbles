//
//  GarbageStation.swift
//  joaninos
//
//  Created by alexdamascena on 18/10/22.
//

import UIKit
import SpriteKit

class GarbageStation: GarbageSubscriber {

    private var garbages: [Garbage] = []
    private let garbageQuantity: Int
    
    private let garbageManager = GarbageManager()
    
    private let objects: [String] = [
        "box", "bottle", "bag"
    ]

    struct Constants {
        static let RANDOM_RANGE_MOVEMENT = 100...900
        static let RANDOM_POSITION = 200...650
    }
    
    private let movements: [Moveable] = [
        VerticalMovement(),
        DiagonalMovement(toSide: .left),
        DiagonalMovement(toSide: .right)
    ]
    
    init(withThisGarbageQuantity quantity: Int){
        self.garbageQuantity = quantity
        setupGarbages()
    }
    
    private func setupGarbages(){
        for _ in 0..<garbageQuantity {
            let randomValue = Int.random(in: Constants.RANDOM_RANGE_MOVEMENT)
            let randomMovementChoice = randomValue % movements.count
            let objectChoice = randomValue % objects.count
   
            let movement = movements[randomMovementChoice]
            
            let newPosition = garbageManager.getNextAvaiablePosition()
                        
            let newGarbage = Garbage(atThisPostion: newPosition,
                                     image: objects[objectChoice],
                                     andMoveLike: movement)
            garbages.append(newGarbage)
        }
    }
    
    func addToGame(insideScene scene: SKScene){
        garbages.forEach{ garbage in
            scene.addChild(garbage)
        }
    }
    
    func update() {
        garbages.forEach{ garbage in
            garbage.movingThroughAxisX()
        }
    }
    
    func didUserShakeIphone(){
        garbages.forEach{ garbage in
            let newPosition = garbageManager.getNextAvaiablePosition()
            let randomValue = Int.random(in: Constants.RANDOM_RANGE_MOVEMENT)
            let randomMovement = randomValue % movements.count
            let movement = movements[randomMovement]
            garbage.change(movement)
            garbage.moveTo(newPosition)
        }
    }
}

