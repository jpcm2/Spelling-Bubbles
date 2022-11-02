//
//  MainGameBackground.swift
//  spelling-bubbles
//
//  Created by alexdamascena on 18/10/22.
//

import SpriteKit

class MainGameBackground: SKSpriteNode, AnyNode {
    
    private var screenSize: CGSize = .zero
    
    init(withSize size: CGSize, andLevel level: Int) {
        self.screenSize = size
        let backgroundName = level >= 1 ? ImageConstants.DARK_MAIN_GAME_BACKGROUND : ImageConstants.MAIN_GAME_BACKGROUND
        let backgroundTexture = SKTexture(imageNamed: backgroundName)
        super.init(texture: backgroundTexture, color: .white, size: size)
        setupNode()
    }
        
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupPosition() {
        self.position = CGPoint(x: screenSize.width/2, y: screenSize.height/2)
        self.size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        self.zPosition = 1
    }
    
}
