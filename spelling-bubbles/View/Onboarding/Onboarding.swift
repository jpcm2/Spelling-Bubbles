//
//  Onboarding.swift
//  spelling-bubbles
//
//  Created by alexdamascena on 02/11/22.
//

import SwiftUI

struct Onboarding: View {
    var body: some View {
        UIOnboardingView()
            .ignoresSafeArea(.all)
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}
