//
//  Bubbles.swift
//  spelling-bubbles
//
//  Created by jpcm2 on 18/10/22.
//

import Foundation
import SpriteKit

struct BubbleConstants {
    static let RANGE_NAME = 100...900
    static let BUBBLE_LETTER_FONT = "SF-Pro-Rounded-Heavy"
    static let BUBBLE_LETTER_FONT_SIZE: CGFloat = 24.0
}

class Bubble: SKNode, AnyNode {
    
    var image: SKSpriteNode = SKSpriteNode()
    var letterLabel: SKLabelNode = SKLabelNode()
    var movement: VerticalWaveMovement?
    var letter: String = String()
    var imageName: String = "rock-0"
    
    init(movement: VerticalWaveMovement, letter: String, nodePosition: AvaiablePosition) {
        super.init()
        createRockImageName()
        
        self.image = SKSpriteNode(texture: SKTexture(imageNamed: imageName))
        self.letter = letter
        self.movement = movement
        
        setupBubbleLabel()
        setupNode()
        
        self.position = nodePosition.position
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createRockImageName(){
        let rockIndexImageName = Int.random(in: BubbleConstants.RANGE_NAME) % 3
        self.imageName = "rock-\(rockIndexImageName)"
    }
    
    func addChilds() {
        addChild(image)
        addChild(letterLabel)
    }
    
    func setupPosition() {
        self.zPosition = 250
    }
    
    func setupPhysicsBody() {
        let texture = SKTexture(imageNamed: imageName)
        let imageSize = image.size
        self.physicsBody = SKPhysicsBody(texture: texture,
                                         size: imageSize)
        self.physicsBody?.affectedByGravity = false
    }
    
    func setupBubbleLabel(){
        let font = UIFont.rounded(ofSize: BubbleConstants.BUBBLE_LETTER_FONT_SIZE,
                                  weight: .semibold)
        let color = UIColor(named: ColorConstants.MID_BLACK) ?? .black
        
        self.letterLabel.attributedText = NSAttributedString(string: letter,
                                                             attributes: [.font: font,
                                                                          .foregroundColor: color])
        
        self.letterLabel.fontColor = .black
        self.letterLabel.fontSize = BubbleConstants.BUBBLE_LETTER_FONT_SIZE
        self.letterLabel.position = CGPoint(x: self.frame.midX,
                                            y: self.frame.midY - self.image.frame.height/5)
        self.letterLabel.name = "bubble"
    }
    
    func movingBubble(){
        guard let movement = self.movement else { return }
        let newYposition = movement.moving(y: self.position.y)
        self.position = CGPoint(x: self.position.x, y: newYposition)
    }
}
