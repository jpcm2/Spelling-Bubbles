//
//  GameViewController+GameSceneDelegate.swift
//  spelling-bubbles
//
//  Created by alexdamascena on 31/10/22.
//

import SwiftUI

extension GameViewController : GameSceneDelegate {
    
    func didUserCompletedLevel() {
        presentLevelCompleteView()
    }
    
    func didUserFailedLevel() {
        presentLevelFailedView()
    }
    
    func didUserPressedPauseButton() {
        presentPauseMenuView()
    }
    
    
    func presentLevelCompleteView() {
        let vc = UIHostingController(rootView: LevelCompleteView(
            actionForNextLevel: {
                print("user taped nextLevel")
                // must call next level, if available
                // else, it should should restart gameScene ?
            },
            actionForMenu: {
                self.viewManager?.didUserTapGoToMenu()
                self.dismiss(animated: true, completion: nil)
            })
        )
        
        vc.modalPresentationStyle = .overFullScreen
        vc.view.backgroundColor = .clear
        self.present(vc, animated: true)
    }
    
    func presentLevelFailedView(){
        let vc = UIHostingController(rootView: LevelFailedView(
            actionForRestart: {
                print("user pressed restart")
            },
            actionForMenu: {
                self.viewManager?.didUserTapGoToMenu()
                self.dismiss(animated: true, completion: nil)
            })
        )
        
        self.scene?.isPaused = true
        vc.modalPresentationStyle = .overFullScreen
        vc.view.backgroundColor = .clear
        self.present(vc, animated: true)
    }
    
    func presentPauseMenuView() {
        let vc = UIHostingController(rootView: PauseMenuView(
            actionXButton: {
                self.scene?.isGamePaused = false
                self.scene?.isPaused = false
                self.dismiss(animated: true, completion: nil)
            },
            actionMenuPressed: {
                self.viewManager?.didUserTapGoToMenu()
                self.levelManager?.levelCompleted()
                self.dismiss(animated: true, completion: nil)
            },
            actionRestartPressed: {
                print("User pressed restart")
            })
        )
        
        self.scene?.isPaused = true
        vc.modalPresentationStyle = .overFullScreen
        vc.view.backgroundColor = .clear
        self.present(vc, animated: true)
    }
}
