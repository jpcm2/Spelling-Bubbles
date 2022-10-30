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
    
    struct Constants {
        static let PAUSE_BUTTON = "pause Button"
    }
    
    override init() {
        super.init()
        self.image = SKSpriteNode(imageNamed: Constants.PAUSE_BUTTON)
        
        setupNode()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addChilds() {
        guard let image = image else { return }
        addChild(image)
    }

    func setupPosition() {
        self.zPosition = 9
        
        let yPosition = CGFloat(UIScreen.main.bounds.height) * 0.92
        let xPosition = CGFloat(UIScreen.main.bounds.width) * 0.91
        self.position = CGPoint(x: xPosition, y: yPosition)
    }
        
    func setupAdditionalConfiguration() {
        self.isUserInteractionEnabled = true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        delegate?.pauseButtonPressed()
    }
}


