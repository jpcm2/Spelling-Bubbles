//
//  GameScene.swift
//  joaninos
//
//  Created by alexdamascena on 10/10/22.
//

import Foundation
import SpriteKit
import GameKit
 
class GameScene: SKScene {
    
//    var gargabeStation: GarbageStation?
    
    override func didMove(to view: SKView) {
        print("entrou aq")
        
//        self.gargabeStation = GarbageStation(withThisGarbageQuantity: 2)

        
        scene?.size = view.bounds.size
        scene?.scaleMode = .aspectFill
                
        self.physicsWorld.gravity = CGVector(dx: 0.0, dy: -0.05)
        
        let border = SKPhysicsBody(edgeLoopFrom: self.frame)
        border.friction = 0
        border.restitution = 1
        self.physicsBody = border
        
//        gargabeStation?.addToGame(insideScene: self)
    }
    
    override func update(_ currentTime: TimeInterval) {
//        gargabeStation?.update()
    }
}

