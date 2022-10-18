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
    
    var background: MainGameBackground?
    
    
    override init(size: CGSize) {
        super.init(size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func didMove(to view: SKView) {

//        self.gargabeStation = GarbageStation(withThisGarbageQuantity: 2)
        background = MainGameBackground(withSize: view.bounds.size)
        
        

        scene?.size = view.bounds.size
        scene?.scaleMode = .aspectFill
        physicsWorld.gravity = CGVector(dx: 0.0, dy: -0.05)
        
        let border = SKPhysicsBody(edgeLoopFrom: self.frame)
        border.friction = 0
        border.restitution = 1
        self.physicsBody = border
        
//        gargabeStation?.addToGame(insideScene: self)
        
        addChild(background ?? SKNode())
    }
    
    override func update(_ currentTime: TimeInterval) {
//        gargabeStation?.update()
    }
}



