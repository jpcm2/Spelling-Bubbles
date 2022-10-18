//
//  GarbageSubscriber.swift
//  joaninos
//
//  Created by alexdamascena on 18/10/22.
//

import Foundation
import SpriteKit

protocol GarbageSubscriber {
    func addToGame(insideScene scene: SKScene)
    func update()
}

