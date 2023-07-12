//
//  OnboardingManager.swift
//  spelling-bubbles
//
//  Created by alexdamascena on 02/11/22.
//

import Foundation

class OnboardingManager {
    
    struct Constants {
        static let KEY = "onboarding"
        static let TUTORIAL = "tutorial"
    }
    
    static let shared = OnboardingManager()
    private init(){}
    
    var wasSeen: Bool {
        return hasUserAlreadySeen != nil
    }
    
    var wasTutorialCompleted: Bool {
        return hasUserCompleteTutorial != nil
    }
    
    var hasUserAlreadySeen: String? {
        return UserDefaults.standard.string(forKey: Constants.KEY)
    }
    
    var hasUserCompleteTutorial: String? {
        return UserDefaults.standard.string(forKey: Constants.TUTORIAL)
    }
    
    func userDidCompleteTutoria() {
        UserDefaults.standard.set(Constants.TUTORIAL, forKey: Constants.TUTORIAL)
    }
    
    func userHasSeenOnboarding(){
        UserDefaults.standard.set(Constants.KEY, forKey: Constants.KEY)
    }

}
