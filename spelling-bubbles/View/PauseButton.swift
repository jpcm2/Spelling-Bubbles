//
//  PauseButton.swift
//  spelling-bubbles
//
//  Created by Lucas Migge de Barros on 20/10/22.
//

import SpriteKit

class PauseButton: SKNode, AnyNode {
    
    private var image : SKSpriteNode?
    weak var delegate : PauseButtonDelegate?
    
    override init() {
        super.init()
        self.image = SKSpriteNode(imageNamed: ImageConstants.PAUSE_BUTTON)
        
        setupNode()
        self.addChild(self.image ?? SKSpriteNode())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupPosition() {
        self.zPosition = 9
        
        let yPosition = CGFloat(UIScreen.main.bounds.height) * 0.92
        let xPosition = CGFloat(UIScreen.main.bounds.width) * 0.93
        self.position = CGPoint(x: xPosition, y: yPosition)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        delegate?.pauseButtonPressed()
    }
    
    func setupAdditionalConfiguration() {
        self.isUserInteractionEnabled = true
    }
}


