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
    }
    
    static let shared = OnboardingManager()
    private init(){}
    
    var wasSeen: Bool {
        return hasUserAlreadySeen != nil
    }
    
    var hasUserAlreadySeen: String? {
        return UserDefaults.standard.string(forKey: Constants.KEY)
    }
    
    func userHasSeenOnboarding(){
        UserDefaults.standard.set(Constants.KEY, forKey: Constants.KEY)
    }

}
