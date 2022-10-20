//
//  BubbleStation.swift
//  spelling-bubbles
//
//  Created by jpcm2 on 18/10/22.
//

import SpriteKit
import UIKit

class BubbleStation: BubbleSubscriber{
    
    private var bubbles: [Bubble] = []
    private let numberOfBubbles: Int
    private let possibleMovements = [VerticalWaveMovement(toSide: .left), VerticalWaveMovement(toSide: .right)]
    private var possiblePositions: [AvaiablePosition] = []
    var index: Int = 0
    
    struct Constants{
        static let SPACE_TO_OCCUPY_ODD = 4
        static let SPACE_TO_OCCUPY_EVEN = 3
        static let MAX_HEIGHT = 180.VAdapted
        static let MIN_HEIGHT = 60.VAdapted
        static let MIN_WIDTH_ODD = 95.VAdapted
        static let MIN_WIDTH_EVEN = 55.VAdapted
        static let VERTICAL_DISTANCE_BETWEEN_BUBBLES = 60
        static let HORIZONTAL_DISTANCE_BETWEEN_BUBBLES = 100
        static let HORIZONTAL_OFFSET_BUBBLES = 40
        static let RANDOM_RANGE_MOVEMENT = 100...900
        static let RANDOM_POSITION = 200...650
        static let RANDOM_LETTER_NUMBER = 65...90
    }
    
    init(numberOfBubbles: Int){
        self.numberOfBubbles = numberOfBubbles
        createAvaiableSpawnPosition()
        self.index = possiblePositions.count
        setupBubbles()
    }
    
    func createAvaiableSpawnPosition(){
        // Pegar as posições
        // Pensar nas posições
        // Altura minima = 80.00 e altura maxima = 230.00 (Iphone 11 --> Ficou meio ruim no iphone menor)
        for row in 1..<4{
            let maxColumn = row % 2 == 0 ? Constants.SPACE_TO_OCCUPY_EVEN:Constants.SPACE_TO_OCCUPY_ODD
            let rawHeight = Int(Constants.MAX_HEIGHT) - (row - 1)*Constants.VERTICAL_DISTANCE_BETWEEN_BUBBLES
            for columnIndex in 0..<maxColumn{
                let minWidth = Int(row % 2 == 1 ? Constants.MIN_WIDTH_EVEN : Constants.MIN_WIDTH_ODD)
                let columnWidth =  minWidth + columnIndex*Constants.HORIZONTAL_DISTANCE_BETWEEN_BUBBLES
                possiblePositions.append(AvaiablePosition(position: CGPoint(x: columnWidth, y: rawHeight), isOccupied: false))
            }
        }
    }
    
    private func setupBubbles(){
        for _ in 0..<self.numberOfBubbles{
            let randomValue = Int.random(in: Constants.RANDOM_RANGE_MOVEMENT)
            
            let randomLetter = "A"
            
            let randomMovementChoice = randomValue % possibleMovements.count
            
            let movement = possibleMovements[randomMovementChoice]

            self.index -= 1
            
            possiblePositions[index].isOccupied = true
            
            let currentBubblePosition = possiblePositions[index]
            
            let newBubble = Bubble(movement: movement, letter: randomLetter, nodePosition: currentBubblePosition)
            
            self.bubbles.append(newBubble)
        }
    }
    
    func addToGame(insideScene scene: SKScene) {
        let bubbleLen = bubbles.count
        for bubbleIndex in 0..<bubbleLen{
            scene.addChild(bubbles[bubbleIndex])
        }
    }
    
    func update() {
        let bubbleLen = bubbles.count
        for bubbleIndex in 0..<bubbleLen{
            bubbles[bubbleIndex].movingBubble()
        }
    }
}
