//
//  PauseButton.swift
//  spelling-bubbles
//
//  Created by Lucas Migge de Barros on 20/10/22.
//

import SpriteKit

class PauseButton: SKNode, AnyNode {
    private var image : SKSpriteNode?
    var delegate : PauseButtonDelegate?
    
    override init() {
        super.init()
        self.name = "pauseButton"
        self.image = SKSpriteNode(imageNamed: ImageConstants.PAUSE_BUTTON)
        self.isUserInteractionEnabled = true
        setupNode()
        self.zPosition = 9
        self.addChild(self.image ?? SKSpriteNode())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupPosition() {
        let screenHeight = Int(UIScreen.main.bounds.height)
        self.position = CGPoint(x: 325.HAdapted, y: screenHeight.VAdapted - 155.VAdapted)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.delegate?.pauseButtonPressed()
    }
}


