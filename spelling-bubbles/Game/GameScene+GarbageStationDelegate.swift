//
//  GameScene+EndRoundLevel.swift
//  spelling-bubbles
//
//  Created by Lucas Migge de Barros on 31/10/22.
//

import Foundation

extension GameScene : GarbageStationDelegate {
    
    func endRoundLevel() {
        controllerGameSceneDelegate?.didUserCompletedLevel()
    }
    
}
