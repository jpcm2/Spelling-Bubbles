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
    
    private var avaiablePositions: [AvaiablePosition] = []
    
    var index: Int = 0
    
    struct Constants {
        static let SPACE_TO_OCCUPY = 6
        static let RANDOM_RANGE_MOVEMENT = 100...900
        static let RANDOM_POSITION = 200...650
    }
    
    private let movements: [Moveable] = [
        WaveMovement(toSide: .left),
        WaveMovement(toSide: .right),
        VerticalMovement(),
        DiagonalMovement()
    ]
    
    init(withThisGarbageQuantity quantity: Int){
        self.garbageQuantity = quantity
        createAvaiableSpawnPosition()
        self.index = avaiablePositions.count
        setupGarbages()

    }
    
    private func createAvaiableSpawnPosition(){
        for newPosition in 1...Constants.SPACE_TO_OCCUPY {
            let newPoint = CGPoint(x: Int(UIScreen.main.bounds.width) - newPosition*newPosition*newPosition,
                                   y: Int(UIScreen.main.bounds.height) - 2*newPosition*newPosition*newPosition)
            print(newPoint)
            let newAvaiablePosition = AvaiablePosition(position: newPoint,
                                                       isOccupied: false)
            avaiablePositions.append(newAvaiablePosition)
        }
    }
    
    private func setupGarbages(){
        for _ in 0..<garbageQuantity {
            let randomValue = Int.random(in: Constants.RANDOM_RANGE_MOVEMENT)
            let randomMovementChoice = randomValue % movements.count
            let movement = movements[randomMovementChoice]

            index -= 1
            avaiablePositions[index].isOccupied = true
            let currentGarbagePosition = avaiablePositions[index]
            
            let newGarbage = Garbage(atThisPostion: currentGarbagePosition,
                                     image: SKSpriteNode(imageNamed: "object"),
                                     andMoveLike: movement)
            self.garbages.append(newGarbage)
        }
    }
    
    func addToGame(insideScene scene: SKScene){
        print(garbages)
        garbages.forEach{ garbage in
            scene.addChild(garbage)
        }
    }
    
    func update() {
        garbages.forEach{ garbage in
            garbage.movingThroughAxisX()
        }
    }
}
