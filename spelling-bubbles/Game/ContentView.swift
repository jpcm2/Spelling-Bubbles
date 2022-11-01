//
//  ContentView.swift
//  joaninos
//
//  Created by alexdamascena on 10/10/22.
//

import SwiftUI
import SpriteKit


struct ContentView: View {
    
    @EnvironmentObject private var viewManager: ViewManager
    let homePage = HomePageView()
    let levelPage = LevelPage()
    
    var body: some View {
        PlayButton()
//        if viewManager.isGameRuning {
//            GameView().ignoresSafeArea(.all)
//        }
//
//        if viewManager.showingHomePage {
//            homePage.ignoresSafeArea(.all)
//        }
//
//        if viewManager.showingLevelPage {
//            levelPage.ignoresSafeArea(.all)
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


