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
    
    var gargabeStation: GarbageStation?
    var bubbleStation: BubbleStation?
    var controllerPauseDelegate: PauseButtonDelegate?

    var background: MainGameBackground?
    var textbox: TextBoxStation?
    var progressBar = ProgressBar(withMaxProgress: 3)
    var boat = Boat()
    var pauseButton = PauseButton()
    
    var isGamePaused: Bool = false {
        didSet {
            self.didUserTapPauseButton()
        }
    }
    
    private func didUserTapPauseButton(){
        if isGamePaused {
            controllerPauseDelegate?.pauseButtonPressed()
        }
    }
    
    override init(size: CGSize) {
        super.init(size: size)
        pauseButton.delegate = self
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMove(to view: SKView) {
        bubbleStation = BubbleStation(numberOfBubbles: 11)
        background = MainGameBackground(withSize: view.bounds.size)
        textbox = TextBoxStation(withWord: "CAIXA")
        progressBar = ProgressBar(withMaxProgress: 3)
        boat = Boat()        
        bubbleStation = BubbleStation(numberOfBubbles: 11)
        background = MainGameBackground(withSize: view.bounds.size)
        textbox = TextBoxStation(withWord: "SACO")
    
        scene?.size = view.bounds.size
        scene?.scaleMode = .aspectFill
        physicsWorld.gravity = CGVector(dx: 0.0, dy: -0.05)
        
        let border = SKPhysicsBody(edgeLoopFrom: self.frame)
        border.friction = 0
        border.restitution = 1
        self.physicsBody = border

        self.gargabeStation = GarbageStation(withThisGarbageQuantity: 2)

        
        
        gargabeStation?.addToGame(insideScene: self)
        textbox?.addToGame(insideScene: self)
        bubbleStation?.addToGame(insideScene: self)
        
     
        addChild(boat ?? SKNode())
        addChild(background ?? SKNode())
        addChild(progressBar)
        addChild(pauseButton)
    }
    
    override func update(_ currentTime: TimeInterval) {
//        gargabeStation?.update()
        if isGamePaused { return }

        gargabeStation?.update()
        boat.update()
        progressBar.update()
        bubbleStation?.update()
        if gargabeStation?.checkPosition() == 1{
            self.scene?.view?.isPaused = true
        }
    }
}


extension GameScene : PauseButtonDelegate {
    func pauseButtonPressed() {
        self.isGamePaused = true
    }
}
