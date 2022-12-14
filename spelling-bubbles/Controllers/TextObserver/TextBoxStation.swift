//
//  TextBoxStation.swift
//  spelling-bubbles
//
//  Created by alexdamascena on 18/10/22.
//

import Foundation
import SpriteKit

class TextBoxStation: TextBoxStationSubscriber {
    
    private var letters: [TextBox] = []
    var word = ""
    var currentWord: String = ""
    var level: Int = 0
    
    private var textBoxSize: CGRect {
        return SKSpriteNode(imageNamed: ImageConstants.TEXT_BOX).frame
    }
    
    private var textBoxWidth: Double {
        return Double(textBoxSize.width)
    }
    
    init(withWord word: String, andLevel level: Int){
        self.word = word
        self.level = level
        self.currentWord = String(repeating: " ", count: self.word.count)
        setupTextBoxAtMiddle()
    }
    
    private func setupTextBoxAtMiddle(){
        let textBoxQuantity = Double(currentWord.count)
        let allTextBoxSize = textBoxQuantity * textBoxWidth + 7.5 * (textBoxQuantity-1)
        let screenSize = Double(UIScreen.main.bounds.width)
        
        let startXPoint = (screenSize - allTextBoxSize)/2 + textBoxWidth/2
        
        let addToYPosition = createNewYPositions()
        
        currentWord.enumerated().forEach{ (index, letter) in
            let newXPosition = startXPoint + Double(index) * (textBoxWidth + 7.5)
            let newLetter = TextBox(withLetter: String(letter),
                                    rockPosition: CGPoint(x: newXPosition, y: addToYPosition[index]),
                                    andLevel: self.level)
            letters.append(newLetter)
        }
    }
    
    private func createNewYPositions() -> [Double] {
        var left = 0
        var right = currentWord.count - 1
        var yPositions: [Double] = []
        var index: Double = 1
                
        for _ in 0..<word.count {
            yPositions.append(0.0)
        }

        while(left < right){
            let position = 2*index*index
            yPositions[left] = position
            yPositions[right] = position
            left += 1
            right -= 1
            index += 1
        }
        
        return yPositions
    }
    
    func addToGame(insideScene scene: SKScene) {
        letters.forEach{ letter in
            scene.addChild(letter)
        }
    }
    
    func resetLettersArray(){
        letters.forEach{ letter in
            letter.removeFromParent()
        }
        letters.removeAll()
        setupTextBoxAtMiddle()
    }
    
    func refreshLetters() {
        self.currentWord = String(repeating: " ", count: self.word.count)
        resetLettersArray()
    }
    
    func checkCurrentWord() -> Bool {
        if(self.currentWord == self.word){
            return true
        }

        return false
    }
}
