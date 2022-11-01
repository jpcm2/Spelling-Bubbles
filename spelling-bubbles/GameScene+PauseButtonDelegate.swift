//
//  GameScene+PauseButtonDelegate.swift
//  spelling-bubbles
//
//  Created by alexdamascena on 27/10/22.
//

import Foundation

extension GameScene : PauseButtonDelegate {
    
    func pauseButtonPressed() {
        isGamePaused = true
        controllerGameSceneDelegate?.didUserPressedPauseButton()
    }
}
