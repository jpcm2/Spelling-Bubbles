//
//  BubbleSubscriber.swift
//  spelling-bubbles
//
//  Created by jpcm2 on 18/10/22.
//
import Foundation
import SpriteKit

protocol BubbleSubscriber {
    func addToGame(insideScene scene: SKScene)
    func update()
}
