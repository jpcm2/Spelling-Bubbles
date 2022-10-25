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
    var imageName: String?
    
    
    init(atThisPostion avaiablePosition: AvaiablePosition, image: String, andMoveLike movement: Moveable){
        super.init()
        self.image = SKSpriteNode(imageNamed: image)
        self.imageName = image
        self.movement = movement
        
        setupNode()
        
        self.position = avaiablePosition.position
        self.addChild(self.image ?? SKSpriteNode())
        self.zPosition = 20
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func movingThroughAxisX(){
        guard let movement = movement else { return }
        let newXPosition = movement.moving(x: self.position.x)
        self.position = CGPoint(x: newXPosition, y: self.position.y)
    }
    
    func setupPosition() {
        self.zPosition = 13
    }
    
    func setupPhysicsBody() {
        guard let image = image else { return }
        self.physicsBody = SKPhysicsBody(texture: SKTexture(imageNamed: self.imageName ?? ""), size: CGSize(width: image.size.width,
                                                                                                height: image.size.height))
    }
    
    func moveTo(_ newPosition: AvaiablePosition){
        self.run( SKAction.move(to: newPosition.position, duration: 0.65) )
    }
    
    func change(_ movement: Moveable){
        self.movement = movement
    }
    
    func checkGarbagePosition() -> Int{
        if(self.position.y <= 100.0){
            self.isHidden = true
            self.physicsBody?.affectedByGravity = false
            return 1
        }
        return 0
    }
}
