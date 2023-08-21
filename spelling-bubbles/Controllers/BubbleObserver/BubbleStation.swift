//
//  BubbleStation.swift
//  spelling-bubbles
//
//  Created by jpcm2 on 18/10/22.
//

import SpriteKit
import UIKit
import SwiftUI

class BubbleStation: BubbleSubscriber {
    
    var bubbles: [Bubble] = []
    private let numberOfBubbles: Int
    private let possibleMovements = [VerticalWaveMovement(toSide: .left), VerticalWaveMovement(toSide: .right)]
    private var possiblePositions: [AvaiablePosition] = []
    var currentWord: String
    var index: Int = 0
    
    struct Constants {
        static let SPACE_TO_OCCUPY_ODD = 4
        static let SPACE_TO_OCCUPY_EVEN = 3
        static let MAX_HEIGHT = 155.VAdapted
        static let MIN_HEIGHT = 60.VAdapted
        static let MIN_WIDTH_ODD = UIScreen.main.bounds.width * 0.15 //83.VAdapted
        static let MIN_WIDTH_EVEN = UIScreen.main.bounds.width * 0.1 //43.VAdapted
        static let VERTICAL_DISTANCE_BETWEEN_BUBBLES = 60.VAdapted
        static let HORIZONTAL_DISTANCE_BETWEEN_BUBBLES = 100.HAdapted
        static let HORIZONTAL_OFFSET_BUBBLES = 40
        static let RANDOM_RANGE_MOVEMENT = 100...900
        static let RANDOM_POSITION = 200...650
        static let RANDOM_LETTER_NUMBER = 65...90
        static let ALPHABET = "ABCDEFGHIJKLMNOPRSTUVWXYZ"
        static let NUMBER_OF_ROWS = 4
    }
    
    init(numberOfBubbles: Int, currentWord: String){
        self.numberOfBubbles = numberOfBubbles
        self.currentWord = currentWord
        createAvaiableSpawnPosition()
        self.index = possiblePositions.count
        setupBubbles()
    }
    
    func createAvaiableSpawnPosition(){
        for row in 1..<Constants.NUMBER_OF_ROWS{
            let maxColumn = row % 2 == 0 ? Constants.SPACE_TO_OCCUPY_EVEN:Constants.SPACE_TO_OCCUPY_ODD
            let rawHeight = Int(Constants.MAX_HEIGHT) - (row - 1)*Int(Constants.VERTICAL_DISTANCE_BETWEEN_BUBBLES)
            for columnIndex in 0..<maxColumn{
                let minWidth = Int(row % 2 == 1 ? Constants.MIN_WIDTH_EVEN : Constants.MIN_WIDTH_ODD)
                let columnWidth =  minWidth + columnIndex*Int(Constants.HORIZONTAL_DISTANCE_BETWEEN_BUBBLES)
                possiblePositions.append(AvaiablePosition(position: CGPoint(x: columnWidth, y: rawHeight), isOccupied: false))
            }
        }
    }
    
    private func setupBubbles(){
        self.currentWord.forEach{letter in
            let randomValue = Int.random(in: Constants.RANDOM_RANGE_MOVEMENT)
            
            let randomMovementChoice = randomValue % possibleMovements.count
            
            let movement = possibleMovements[randomMovementChoice]
            
            self.index -= 1
            
            possiblePositions[index].isOccupied = true
            
            let currentBubblePosition = possiblePositions[index]
            
            let newBubble = Bubble(movement: movement, letter: String(letter), nodePosition: currentBubblePosition)
            
            self.bubbles.append(newBubble)
        }
        
        for _ in 0..<(self.numberOfBubbles - self.currentWord.count){
            let randomValue = Int.random(in: Constants.RANDOM_RANGE_MOVEMENT)
            
            guard let randomLetter = Constants.ALPHABET.randomElement() else {return}
            
            let randomMovementChoice = randomValue % possibleMovements.count
            
            let movement = possibleMovements[randomMovementChoice]
            
            self.index -= 1
            
            possiblePositions[index].isOccupied = true
            
            let currentBubblePosition = possiblePositions[index]
            
            let newBubble = Bubble(movement: movement, letter: String(randomLetter), nodePosition: currentBubblePosition)
            
            self.bubbles.append(newBubble)
        }
        
        for firstBubbleIndex in 0..<self.bubbles.count{
            for secondBubbleIndex in firstBubbleIndex+1..<self.bubbles.count{
                let random = Int.random(in: 0...1)
                if random == 0 {
                    swap(&self.bubbles[firstBubbleIndex].position, &self.bubbles[secondBubbleIndex].position)
                }
            }
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
    
    func refreshBubbles(){
        for bubble in bubbles {
            bubble.isPaused = false
            bubble.isHidden = false
        }
    }
    
    func refreshBubblesToNewWord(withName garbageName: String){
        for bubble in bubbles {
            bubble.removeFromParent()
        }
        bubbles.removeAll()
        self.index = possiblePositions.count
        self.currentWord = garbageName
        setupBubbles()
    }
}
