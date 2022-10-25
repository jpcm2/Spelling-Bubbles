
//
//  Boat.swift
//  spelling-bubbles
//
//  Created by Lucas Migge de Barros on 18/10/22.
//
import Foundation
import SwiftUI
import SpriteKit

class Boat : SKNode, AnyNode {
    
    var side : MovementSide = .left
    
    let movementX : Moveable = BoatHorizontalMovement(beginTo: .left)
    let movementY : Moveable = BoatVerticalMovement(beginTo: .right)
    let movementRotation : Moveable = BoatAngularMovement(beginTo: .left)
        
    var image : SKSpriteNode?
    
    override init() {
        super.init()
        setupNode()
        self.image = SKSpriteNode(imageNamed: ImageConstants.BOAT)
        self.addChild(self.image ?? SKSpriteNode())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(){
        let newXPosition = movementX.moving(x: self.position.x)
        self.position.x = newXPosition
        
        let newYPosition = movementY.moving(x: self.position.y)
        self.position.y = newYPosition
        
        let newAngularPosition = movementRotation.moving(x: self.zRotation)
        self.zRotation = newAngularPosition
    }
    
    func setupPosition() {
        let midleOfScreen = Int(UIScreen.main.bounds.width / 2)
        let screenHeight = CGFloat(UIScreen.main.bounds.height * 0.84)
        self.position = CGPoint(x: midleOfScreen.HAdapted - 25.HAdapted, y: screenHeight)
    }
    
    func setupPhysicsBody() {
        guard let image = self.image else { return }
        let size = CGSize(width: image.size.width,
                          height: image.size.height)
        
        let texture = SKTexture(imageNamed: ImageConstants.BOAT)
        
        self.physicsBody = SKPhysicsBody(texture: texture,
                                         size: size)
    }
    
    func setupAdditionalConfiguration() {
        self.zRotation = 0
        self.zPosition = 13
    }
}
