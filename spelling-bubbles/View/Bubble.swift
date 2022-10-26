//
//  Bubbles.swift
//  spelling-bubbles
//
//  Created by jpcm2 on 18/10/22.
//

import Foundation
import SpriteKit

struct BubbleConstants {
    static let BUBBLE_IMAGE_NAME = "bubble-bg"
    static let BUBBLE_LETTER_FONT = "SF-Pro-Rounded-Heavy"
    static let BUBBLE_LETTER_FONT_SIZE: CGFloat = 24.0
}

class Bubble: SKNode, AnyNode{
    
    var image: SKSpriteNode = SKSpriteNode()
    var letterLabel: SKLabelNode = SKLabelNode()
    var movement: VerticalWaveMovement?
    var letter: String = String()
    
    init(movement: VerticalWaveMovement, letter: String, nodePosition: AvaiablePosition) {
        super.init()
        self.image = SKSpriteNode(texture: SKTexture(imageNamed: BubbleConstants.BUBBLE_IMAGE_NAME))
        self.letter = letter
        self.movement = movement
        setupBubbleLabel()
        setupNode()

        self.position = nodePosition.position
        self.addChild(self.image)
        self.addChild(self.letterLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupBubbleLabel(){
        self.letterLabel.attributedText = NSAttributedString(string: letter,
                                                             attributes:[.font: UIFont.rounded(ofSize: BubbleConstants.BUBBLE_LETTER_FONT_SIZE, weight: .semibold),
                                                          .foregroundColor: UIColor(named: ColorConstants.MID_BLACK) ?? .black])
        self.letterLabel.fontColor = .black
        self.letterLabel.fontSize = BubbleConstants.BUBBLE_LETTER_FONT_SIZE
        self.letterLabel.position = CGPoint(x: self.frame.midX, y: self.frame.midY - self.image.frame.height/5)
        self.letterLabel.name = "bubble"
    }
    
    func setupPosition() {
        self.zPosition = 250
    }
    
    func setupPhysicsBody() {
        //let texture = SKTexture(imageNamed: BubbleConstants.BUBBLE_IMAGE_NAME)
        //let imageSize = image.size
        //self.physicsBody = SKPhysicsBody(texture: texture,
        //                                 size: imageSize)
        //self.physicsBody?.affectedByGravity = false
    }
    
    func movingBubble(){
        guard let movement = self.movement else{return}
        let newYposition = movement.moving(y: self.position.y)
        self.position = CGPoint(x: self.position.x, y: newYposition)
    }
    

}
