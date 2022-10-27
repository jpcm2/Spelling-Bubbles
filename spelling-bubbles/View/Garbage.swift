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
    var objectName: String?
    
    struct Constants {
        static let GAME_OVER_HEIGHT = 100.0
        static let TRUE = 1
        static let FALSE = 0
    }
    
    init(atThisPostion avaiablePosition: AvaiablePosition,
         image: String,
         andMoveLike movement: Moveable,
         withName name: String
    ){
        super.init()
        self.image = SKSpriteNode(imageNamed: image)
        self.imageName = image
        self.movement = movement
        self.objectName = name
        
        setupNode()
        
        self.position = avaiablePosition.position
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addChilds() {
        guard let image = image else { return }
        addChild(image)
    }
    
    func setupPosition() {
        self.zPosition = 20
    }
    
    func setupPhysicsBody() {
        guard let image = image else { return }
        let imageSize = image.size
        let texture = SKTexture(imageNamed: self.imageName ?? "")
        self.physicsBody = SKPhysicsBody(texture: texture, size: imageSize)
    }
    
    func movingThroughAxisX(){
        guard let movement = movement else { return }
        let newXPosition = movement.moving(x: self.position.x)
        self.position = CGPoint(x: newXPosition, y: self.position.y)
    }
    
    func moveTo(_ newPosition: AvaiablePosition){
        self.run( SKAction.move(to: newPosition.position, duration: 0.65) )
    }
    
    func change(_ movement: Moveable){
        self.movement = movement
    }
    
    func checkGarbagePosition() -> Int {
        if(self.position.y <= Constants.GAME_OVER_HEIGHT){
            self.isHidden = true
            self.physicsBody?.affectedByGravity = false
            return Constants.TRUE
        }
        return Constants.FALSE
    }
}
