//
//  GameScene+TouchesBegan.swift
//  spelling-bubbles
//
//  Created by jpcm2 on 24/10/22.
//

import SpriteKit
import AudioToolbox

extension GameScene {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            
            var touchedBubble: Bubble?
            
            guard let safeBubbleSation = bubbleStation else { return }
            
            for bubble in safeBubbleSation.bubbles {
                if bubble.contains(location) {
                    if !bubble.isHidden {
                        touchedBubble = bubble
                    }
                }
            }
            
            guard let touchedNode = touchedBubble else { return }
           
            let selectedString = touchedNode.letter
            
            touchedNode.isPaused = true
            
            touchedNode.isHidden = true
            
            guard let range = textbox?.currentWord.range(of: " ") else {return}
            
            guard let newString = textbox?.currentWord.replacingCharacters(in: range, with: selectedString) else { return }
            
            textbox?.currentWord = newString
            
            textbox?.resetLettersArray()
            
            textbox?.addToGame(insideScene: self)
            
            guard let wordSize = textbox?.word.count else {return}
            var currentWordRealSize = 0
            
            newString.forEach{letter in
                if letter != " "{
                    currentWordRealSize += 1
                }
            }
            
            if wordSize == currentWordRealSize{
                guard let ret = textbox?.checkCurrentWord() else{return}
                if ret{
                    gargabeStation?.removeGarbage()
                    gargabeStation?.setupIndicatedGarbage()
                    guard let newWord = gargabeStation?.indicatedGarbage?.objectName else {return}
                    textbox?.word = newWord
                    textbox?.refreshLetters()
                    bubbleStation?.refreshBubblesToNewWord(withName: newWord)
                    bubbleStation?.addToGame(insideScene: self)
                    textbox?.addToGame(insideScene: self)
                    
                }else{
                    //UIDevice.Vibrate()
                    bubbleStation?.refreshBubbles()
                    textbox?.refreshLetters()
                    textbox?.addToGame(insideScene: self)
                }
            }
        }
    }
}
