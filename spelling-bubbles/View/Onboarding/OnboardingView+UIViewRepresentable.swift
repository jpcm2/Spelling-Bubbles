//
//  OnboardingView+UIViewRepresentable.swift
//  spelling-bubbles
//
//  Created by alexdamascena on 02/11/22.
//

import SwiftUI


struct UIOnboardingView: UIViewRepresentable {

    typealias UIViewType = OnboardingView
    
    func makeUIView(context: Context) -> OnboardingView {
        return OnboardingView()
    }
    
    func updateUIView(_ uiView: OnboardingView, context: Context) {}

}
