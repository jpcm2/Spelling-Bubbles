//
//  Onboarding.swift
//  spelling-bubbles
//
//  Created by alexdamascena on 02/11/22.
//

import SwiftUI

struct Onboarding: View {
    
    @EnvironmentObject private var viewManager: ViewManager
    
    var widthScreen: CGFloat {
        return UIScreen.main.bounds.width
    }
    
    private struct Constants {
        static let JUMP_ONBOARDING = "pular-off"
    }
    
    var body: some View {
        UIOnboardingView()
            .ignoresSafeArea(.all)
            .overlay{
                Image(Constants.JUMP_ONBOARDING)
                    .resizable()
                    .frame(width: 85, height: 45)
                    .position(x: widthScreen - 70, y: 80)
                    .onTapGesture{
                        OnboardingManager.shared.userHasSeenOnboarding()
                        viewManager.didUserWatchOnboarding()
                    }
            }
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}
