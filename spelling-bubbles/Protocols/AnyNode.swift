//
//  AnyNode.swift
//  joaninos
//
//  Created by alexdamascena on 18/10/22.
//

import Foundation


protocol AnyNode {
    func setupPosition()
    func setupPhysicsBody()
    func setupAdditionalConfiguration()
}

extension AnyNode {
    func setupNode(){
        setupPosition()
        setupPhysicsBody()
        setupAdditionalConfiguration()
    }
    
    func setupAdditionalConfiguration(){}
    func setupPhysicsBody(){}
}

