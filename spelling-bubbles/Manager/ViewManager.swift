//
//  ViewManager.swift
//  spelling-bubbles
//
//  Created by alexdamascena on 29/10/22.
//

import Foundation

class ViewManager: ObservableObject {
    
    @Published var isGameRuning = false
    @Published var showingHomePage = false
    @Published var showingLevelPage = false
    @Published var showingOnboarding = false
    
    
    init(){
        checkIfUserWatchedOnboarding()
    }
    
    private func checkIfUserWatchedOnboarding(){
        if OnboardingManager.shared.wasSeen {
            showingOnboarding = false
            showingHomePage = true
        } else {
            showingOnboarding = true
        }
    }
    
    
    func didUserTapStartButton(){
        showingHomePage = false
        showingLevelPage = true
    }
    
    func didUserTapGoBackToHomePage(){
        showingLevelPage = false
        showingHomePage = true
    }
    
    func didUserTapToStartGame(){
        showingLevelPage = false
        isGameRuning = true
    }
    
    func didUserTapGoToMenu(){
        isGameRuning = false
        showingLevelPage = true
    }
    
    func didUserWatchOnboarding(){
        showingHomePage = true
        showingOnboarding = false
    }
    
    func didUserTapToRestartGame(){
        isGameRuning.toggle()
        sleep(1)
        isGameRuning.toggle()
    }
}

