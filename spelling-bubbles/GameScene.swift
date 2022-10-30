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
    
    //    var progressBar = ProgressBar(withMaxProgress: 3)
    var gargabeStation: GarbageStation?
    var bubbleStation: BubbleStation?
    var controllerPauseDelegate: PauseButtonDelegate?
    var background: MainGameBackground?
    var textbox: TextBoxStation?
    var boat = Boat()
    var pauseButton = PauseButton()
    var level: Int = 1

    var isGamePaused: Bool = false {
        didSet {
            didUserTapPauseButton()
        }
    }
    
    private func didUserTapPauseButton(){
        if isGamePaused {
            controllerPauseDelegate?.pauseButtonPressed()
        }
    }
    
    init(withLevel level: Int, andSize size: CGSize ){
        super.init(size: size)
        pauseButton.delegate = self
        self.level = level
    }
    
    override init(size: CGSize) {
        super.init(size: size)
        pauseButton.delegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMove(to view: SKView) {
        setupGravityAndConfiguration(inside: view)
        createBorderAtGameScene()
        
        gargabeStation = GarbageStation(withThisGarbageQuantity: level)
        bubbleStation = BubbleStation(numberOfBubbles: 11)
        background = MainGameBackground(withSize: view.bounds.size)
        textbox = TextBoxStation(withWord: gargabeStation?.indicatedGarbage?.objectName ?? "CAIXA")
        
        gargabeStation?.addToGame(insideScene: self)
        textbox?.addToGame(insideScene: self)
        bubbleStation?.addToGame(insideScene: self)
        
        [boat, background, pauseButton].forEach{ viewObject in
            addChild( viewObject ?? SKNode())
        }
    }
    
    private func setupGravityAndConfiguration(inside view: SKView){
        scene?.size = view.bounds.size
        scene?.scaleMode = .aspectFill
        physicsWorld.gravity = CGVector(dx: 0.0, dy: -0.03)
    }
    
    private func createBorderAtGameScene(){
        let border = SKPhysicsBody(edgeLoopFrom: self.frame)
        border.friction = 0
        border.restitution = 1
        self.physicsBody = border
    }
    
    override func update(_ currentTime: TimeInterval) {
        if isGamePaused { return }
        
        gargabeStation?.update()
        boat.update()

        bubbleStation?.update()
        
        if gargabeStation?.checkPosition() == 1 {
            self.scene?.view?.isPaused = true
            
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3){
            self.gargabeStation?.moveCompletedGarbage(toBoat: self.boat,
                                                      withCorretWord: self.textbox)
        }
    }
}



