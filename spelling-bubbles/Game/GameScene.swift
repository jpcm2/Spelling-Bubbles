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
    var controllerGameSceneDelegate: GameSceneDelegate?
    var background: MainGameBackground?
    var textbox: TextBoxStation?
    var boat = Boat()
    var pauseButton = PauseButton()
    var level: Int = 1
    
    struct Constants {
        static let numberOfBubbles = 11
    }
    
    var isGamePaused: Bool = false
       
    
    init(withLevel level: Int, andSize size: CGSize ){
        super.init(size: size)
        self.level = level
    }
    
    override init(size: CGSize) {
        super.init(size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMove(to view: SKView) {
        setupGravityAndConfiguration(inside: view)
        createBorderAtGameScene()
        
        gargabeStation = GarbageStation(withThisGarbageQuantity: level)
        background = MainGameBackground(withSize: view.bounds.size)
        guard let currentWordOnTextBox = gargabeStation?.indicatedGarbage?.objectName else {return}
        textbox = TextBoxStation(withWord: currentWordOnTextBox)
        bubbleStation = BubbleStation(numberOfBubbles: Constants.numberOfBubbles, currentWord: currentWordOnTextBox)
        
        gargabeStation?.addToGame(insideScene: self)
        textbox?.addToGame(insideScene: self)
        bubbleStation?.addToGame(insideScene: self)
        
        [boat, background, pauseButton].forEach{ viewObject in
            addChild( viewObject ?? SKNode())
        }
        
        pauseButton.delegate = self
        gargabeStation?.delegate = self
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
    
    func restartScene(){
        self.removeAllChildren()
        setupGravityAndConfiguration(inside: self.view ?? SKView())
        createBorderAtGameScene()
        
        gargabeStation = GarbageStation(withThisGarbageQuantity: level)
        background = MainGameBackground(withSize: self.view?.bounds.size ?? SKView().bounds.size)
        guard let currentWordOnTextBox = gargabeStation?.indicatedGarbage?.objectName else {return}
        textbox = TextBoxStation(withWord: currentWordOnTextBox)
        bubbleStation = BubbleStation(numberOfBubbles: Constants.numberOfBubbles, currentWord: currentWordOnTextBox)
        
        gargabeStation?.addToGame(insideScene: self)
        textbox?.addToGame(insideScene: self)
        bubbleStation?.addToGame(insideScene: self)
        
        [boat, background, pauseButton].forEach{ viewObject in
            addChild( viewObject ?? SKNode())
        }
        
        pauseButton.delegate = self
        gargabeStation?.delegate = self
    }
    
    override func update(_ currentTime: TimeInterval) {
        if isGamePaused { return }
        
        gargabeStation?.update()
        boat.update()

        bubbleStation?.update()
        
        if gargabeStation?.checkPosition() == 1 {
            controllerGameSceneDelegate?.didUserFailedLevel()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3){
            self.gargabeStation?.moveCompletedGarbage(toBoat: self.boat,
                                                      withCorretWord: self.textbox)
        }
    }
}



