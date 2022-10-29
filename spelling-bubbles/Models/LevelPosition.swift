//
//  LevelPosition.swift
//  spelling-bubbles
//
//  Created by alexdamascena on 29/10/22.
//

import Foundation


struct LevelPosition: Hashable, Identifiable {
    var id: ObjectIdentifier?
    let x: Double
    let y: Double
}
