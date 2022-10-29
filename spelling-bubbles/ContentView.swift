//
//  ContentView.swift
//  joaninos
//
//  Created by alexdamascena on 10/10/22.
//

import SwiftUI
import SpriteKit


struct GameView: UIViewControllerRepresentable {
    
    typealias UIViewControllerType = GameViewController
    
    func makeUIViewController(context: Context) -> GameViewController {
        return GameViewController()
    }
    
    func updateUIViewController(_ uiViewController: GameViewController, context: Context) {}
}

struct ContentView: View {
    
    @EnvironmentObject private var viewManager: ViewManager
    

    
    var body: some View {
        
        if viewManager.isGameRuning {
            GameView()
                .ignoresSafeArea(.all)
        }

        if viewManager.showingHomePage {
            HomePageView()
                .ignoresSafeArea(.all)
        }

        if viewManager.showingLevelPage {

            LevelPage(actionAfterChosenLevel: {
            })
            .ignoresSafeArea(.all)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


