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
    
    var bubbleStation: BubbleStation?
    
    var background: MainGameBackground?
    var textbox: TextBoxStation?
    var progressBar = ProgressBar(withMaxProgress: 3)
    var boat = Boat()
    var pauseButton = PauseButton()
    
    
    override init(size: CGSize) {
        super.init(size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func didMove(to view: SKView) {
        
        
        scene?.size = view.bounds.size
        scene?.scaleMode = .aspectFill
        physicsWorld.gravity = CGVector(dx: 0.0, dy: -0.05)
        
        let border = SKPhysicsBody(edgeLoopFrom: self.frame)
        border.friction = 0
        border.restitution = 1
        self.physicsBody = border

//        self.gargabeStation = GarbageStation(withThisGarbageQuantity: 2)
        
        self.bubbleStation = BubbleStation(numberOfBubbles: 11)
        background = MainGameBackground(withSize: view.bounds.size)
        textbox = TextBoxStation(withWord: "CAIXA")
        
        
//        gargabeStation?.addToGame(insideScene: self)
        textbox?.addToGame(insideScene: self)
        self.bubbleStation?.addToGame(insideScene: self)
        
     
        
        addChild(boat)
        
        addChild(background ?? SKNode())
        addChild(progressBar)
        addChild(pauseButton)
    }
    
    override func update(_ currentTime: TimeInterval) {
//        gargabeStation?.update()
        boat.update()
        progressBar.update()
        self.bubbleStation?.update()
    
    }
}



