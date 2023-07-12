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
    
    private func pauseGame() {
        self.scene?.isGamePaused = true
        self.scene?.isPaused = true
    }
    
    private func resumeGame() {
        self.scene?.isGamePaused = false
        self.scene?.isPaused = false
    }
    
    func presentLevelCompleteView() {
        self.levelManager?.levelCompleted()
        let vc = UIHostingController(rootView: LevelCompleteView(
            actionForNextLevel: {
                print("user taped nextLevel")
                self.scene?.level += 1
                self.scene?.restartScene()
                self.scene?.isPaused = false
                self.dismiss(animated: true)
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
                self.scene?.restartScene()
                self.scene?.isPaused = false
                self.dismiss(animated: true)
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
                self.dismiss(animated: true, completion: nil)
            },
            actionRestartPressed: {
                print("User pressed restart")
                self.scene?.restartScene()
                self.scene?.isPaused = false
                self.dismiss(animated: true)
            })
        )
        
        self.scene?.isPaused = true
        vc.modalPresentationStyle = .overFullScreen
        vc.view.backgroundColor = .clear
        self.present(vc, animated: true)
    }
    
    func presentTutorialView() {
        let onboardingManager = OnboardingManager.shared
        
        if !onboardingManager.wasTutorialCompleted {
            
            let viewModel: TutorialViewModel = TutorialViewModel(userDidfinishTutorial: userCompletedTutorial)
            
            let vc = UIHostingController(rootView: TutorialView(viewModel: viewModel))
            
            self.scene?.isGamePaused = true
            self.scene?.isPaused = true
            vc.modalPresentationStyle = .overFullScreen
            vc.view.backgroundColor = .clear
            self.present(vc, animated:  true)
            
        } else {
            print("user already seen tutorial")
        }
        
    }
    
    private func userCompletedTutorial() {
        let onboardingManager = OnboardingManager.shared
        
        self.scene?.isGamePaused = false
        self.scene?.isPaused = false
        self.dismiss(animated: true, completion: nil)
        
        onboardingManager.userDidCompleteTutoria()
    }
}
