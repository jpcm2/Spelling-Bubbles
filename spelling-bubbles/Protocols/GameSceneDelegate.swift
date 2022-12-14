//
//  VictoryDelegate.swift
//  spelling-bubbles
//
//  Created by Lucas Migge de Barros on 31/10/22.
//

import Foundation
protocol GameSceneDelegate: AnyObject {
    func didUserCompletedLevel()
    
    func didUserFailedLevel()
    
    func didUserPressedPauseButton()
}
