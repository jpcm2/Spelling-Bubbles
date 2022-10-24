//
//  GameScene+TouchesBegan.swift
//  spelling-bubbles
//
//  Created by jpcm2 on 24/10/22.
//

import SpriteKit

extension GameScene {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            
            guard let touchedNode = self.atPoint(location) as? SKLabelNode else{return}
           
            guard let selectedLetter = touchedNode.attributedText?.string else {return}

            guard let touchedNodeParent = touchedNode.parent else {return}
            
            touchedNodeParent.isPaused = true
            
            touchedNodeParent.isHidden = true
            
        }
    }
}
