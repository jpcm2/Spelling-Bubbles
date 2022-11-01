//
//  GameView+UIViewControllerRepresentable.swift
//  spelling-bubbles
//
//  Created by alexdamascena on 31/10/22.
//

import SwiftUI

struct GameView: UIViewControllerRepresentable {
    
    @EnvironmentObject private var viewManager: ViewManager
    @EnvironmentObject private var levelManager: LevelManager
    
    typealias UIViewControllerType = GameViewController
    
    func makeUIViewController(context: Context) -> GameViewController {
        return GameViewController(viewManager: viewManager,
                                  levelManager: levelManager)
    }
    
    func updateUIViewController(_ uiViewController: GameViewController, context: Context) {}
}
