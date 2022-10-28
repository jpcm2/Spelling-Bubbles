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
    
    @State var showingHomePage = true
    @State var isGameRunning = false
    @State var showingLevelPage = false
    
    var body: some View {
        
        if isGameRunning {
            GameView()
                .ignoresSafeArea(.all)
        }

        if showingHomePage {
            HomePageView(){
                showingHomePage = false
                showingLevelPage = true
            }.ignoresSafeArea(.all)
        }

        if showingLevelPage {
            LevelPage(){
                showingLevelPage = false
                isGameRunning = true
            }.ignoresSafeArea(.all)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


