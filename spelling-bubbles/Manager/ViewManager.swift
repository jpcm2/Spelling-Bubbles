//
//  ViewManager.swift
//  spelling-bubbles
//
//  Created by alexdamascena on 29/10/22.
//

import Foundation

class ViewManager: ObservableObject {
    
    @Published var isGameRuning = false
    @Published var showingHomePage = true
    @Published var showingLevelPage = false
    
    
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
}

