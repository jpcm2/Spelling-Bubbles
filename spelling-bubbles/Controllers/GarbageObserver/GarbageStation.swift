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
    private var indicatedGarbage: Garbage?
    
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
        self.setupGarbages()
        self.setupIndicatedGarbage()
    }
    
    private func setupGarbages(){
        for _ in 0..<garbageQuantity {
            let randomValue = Int.random(in: Constants.RANDOM_RANGE_MOVEMENT)
            let randomMovementChoice = randomValue % movements.count
            let objectChoice = randomValue % objects.count
   
            let movement = movements[randomMovementChoice]
            
            let newPosition = garbageManager.getNextAvaiablePosition()
            
            let name = objects[objectChoice]
                        
            let newGarbage = Garbage(atThisPostion: newPosition,
                                     image: "box",
                                     andMoveLike: movement,
                                     withName: "box")
            garbages.append(newGarbage)
        }
    }
    
    func setupIndicatedGarbage(){
        let randomIndex = Int.random(in: 0...self.garbageQuantity-1)
        garbages[randomIndex].toggleIndication()
        self.indicatedGarbage = garbages[randomIndex]
    }
    
    func addToGame(insideScene scene: SKScene){
        garbages.forEach{ garbage in
            scene.addChild(garbage)
        }
    }
    
    func checkPosition() -> Int{
        var ret: Int = 0
        garbages.forEach{garbage in
            ret = ret | garbage.checkGarbagePosition()
        }
        return ret
    }
    
    func update() {
        garbages.forEach{ garbage in
            garbage.movingThroughAxisX()
            garbage.checkIndication()
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
    
    func moveCompletedGarbage(toBoat boat: Boat?, withCorretWord station: TextBoxStation?){
        guard let boat = boat, let station = station else { return }
        
        let garbageFiltered = garbages.filter({ garbage in
            garbage.objectName == station.word.lowercased()
        })
        
        garbageFiltered.forEach{ garbage in
            garbage.physicsBody = nil
            garbage.run(SKAction.move(to: boat.position, duration: 0.65))
        }
        
        let time = Double(garbageFiltered.count)*0.65
        
        DispatchQueue.main.asyncAfter(deadline: .now() + time){
            garbageFiltered.forEach{ garbage in
                garbage.removeFromParent()
            }
        }
    }

}

