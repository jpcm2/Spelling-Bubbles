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
            
            guard let touchedNode = self.atPoint(location) as? SKLabelNode else { return }
           
            guard let selectedString = touchedNode.attributedText?.string else { return }

            guard let touchedNodeParent = touchedNode.parent else {return}
            
            touchedNodeParent.isPaused = true
            
            touchedNodeParent.isHidden = true
            
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
                    textbox?.word = gargabeStation?.indicatedGarbage?.objectName ?? "CAIXA"
                    textbox?.refreshLetters()
                    bubbleStation?.refreshBubbles()
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
