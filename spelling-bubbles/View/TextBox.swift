//
//  TextBox.swift
//  spelling-bubbles
//
//  Created by alexdamascena on 18/10/22.
//

import Foundation
import SpriteKit

class TextBox: SKNode, AnyNode {
    
    struct Constants {
        static let HEIGHT_COMPENSATOR: CGFloat = 3.5
    }

    var image: SKSpriteNode?
    let letterBox = SKLabelNode()
    var letter: String?
    var xPosition: Double?
    
    init(withLetter letter: String, andXPosition position: Double){
        super.init()
        self.letter = letter
        self.image = SKSpriteNode(imageNamed: ImageConstants.TEXT_BOX)
        self.xPosition = position
        setupLetterInsideBox()
        setupNode()
        addChild(image ?? SKSpriteNode())
        addChild(letterBox)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLetterInsideBox(){
        letterBox.attributedText = NSAttributedString(string: letter ?? "",
                                                      attributes:[.font: UIFont.rounded(ofSize: 42, weight: .semibold),
                                                                   .foregroundColor: UIColor(named: ColorConstants.MID_BLACK) ?? .black])
        guard let image = image else { return }
        letterBox.position = CGPoint(x: frame.midX, y: frame.midY - image.frame.height/Constants.HEIGHT_COMPENSATOR)
    }
    
    func setupPosition() {
        guard let xPosition = xPosition else { return }
        self.position = CGPoint(x: xPosition, y: 242.VAdapted)
    }
    
    func setupAdditionalConfiguration() {
        self.zPosition = 3
    }
}
