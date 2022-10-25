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
    
    
    @State var showingPauseMenu = true
    
    var body: some View {
        GameView()
            .ignoresSafeArea()
    }
    
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


