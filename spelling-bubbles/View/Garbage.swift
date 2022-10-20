//
//  Garbage.swift
//  joaninos
//
//  Created by alexdamascena on 18/10/22.
//

import Foundation
import SpriteKit

class Garbage: SKNode, AnyNode {

    var movement: Moveable?
    var image: SKSpriteNode?
    var id: Int?
    
    init(atThisPostion avaiablePosition: AvaiablePosition, image: SKSpriteNode, andMoveLike movement: Moveable){
        super.init()
        self.image = image
        self.movement = movement
        setupNode()
        self.position = avaiablePosition.position
        self.addChild(image)
        self.zPosition = 13
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func movingThroughAxisX(){
        guard let movement = movement else { return }
        let newXPosition = movement.moving(x: self.position.x)
        self.position = CGPoint(x: newXPosition, y: self.position.y)
    }
    
    func setupPosition() {}
    
    func setupPhysicsBody() {
        guard let image = image else { return }
        self.physicsBody = SKPhysicsBody(texture: SKTexture(imageNamed: "object"), size: CGSize(width: image.size.width,
                                                                                                height: image.size.height))
    }
}

