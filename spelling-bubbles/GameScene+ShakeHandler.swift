//
//  GameScene+ShakeHandler.swift
//  spelling-bubbles
//
//  Created by alexdamascena on 18/10/22.
//

import Foundation

extension GameScene: ShakeHandler {
    
    func didUserStartShake() {
        print("shake funcionando")
        bubbleStation?.refreshBubbles()
        textbox?.refreshLetters()
        textbox?.addToGame(insideScene: self)
    }
}
