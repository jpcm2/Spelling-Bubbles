//
//  TextBoxStation.swift
//  spelling-bubbles
//
//  Created by alexdamascena on 18/10/22.
//

import Foundation
import SpriteKit

protocol TextBoxStationSubscriber {
    func addToGame(insideScene scene: SKScene)
}

class TextBoxStation: TextBoxStationSubscriber {
    
    private var textBoxSize: CGRect {
        return SKSpriteNode(imageNamed: ImageConstants.TEXT_BOX).frame
    }
    
    private var textBoxWidth: Double {
        return Double(textBoxSize.width)
    }

    private var letters: [TextBox] = []
    private var word = "CAIXA"
    var currentWord: String = ""
    
    init(withWord word: String){
        self.word = word
        self.currentWord = String(repeating: " ", count: self.word.count)
        setupTextBoxAtMiddle()
    }
    
    private func setupTextBoxAtMiddle(){
        let textBoxQuantity = Double(currentWord.count)
        let allTextBoxSize = textBoxQuantity * textBoxWidth + 7.5 * (textBoxQuantity-1)
        let screenSize = Double(UIScreen.main.bounds.width)
        print(allTextBoxSize)
        let startXPoint = (screenSize - allTextBoxSize)/2 + textBoxWidth/2
        
        currentWord.enumerated().forEach{ (index, letter) in
            let newXPosition = startXPoint + Double(index) * (textBoxWidth + 7.5)
            let newLetter = TextBox(withLetter: String(letter),
                                    andXPosition: newXPosition)
            letters.append(newLetter)
        }
    }
    
    func addToGame(insideScene scene: SKScene) {
        letters.forEach{ letter in
            scene.addChild(letter)
        }
    }
    
    func resetLettersArray(){
        letters.removeAll()
        setupTextBoxAtMiddle()
    }
    
    func refreshLetters() {
        self.currentWord = String(repeating: " ", count: self.word.count)
        resetLettersArray()
        
        
    }
}
