//
//  LevelPage.swift
//  spelling-bubbles
//
//  Created by alexdamascena on 27/10/22.
//

import Foundation
import SwiftUI

struct LevelPage : View {
    
    @EnvironmentObject private var viewManager: ViewManager
    @EnvironmentObject private var levelManager: LevelManager
    
    @State var showingSettingsView = false
        
    struct Constants {
        static let BACKGROUND = "level-map"
    }
    
    let paddings = EdgeInsets(top: 47.VAdapted,
                              leading: 14.HAdapted,
                              bottom: 0,
                              trailing: 14.HAdapted)
    
    private func userCanPlatAt(_ level: Level) -> Bool {
        return level.status == .currrent
    }
    
    
    var body: some View {
        ZStack{
            Image(Constants.BACKGROUND)
                .resizable()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                .edgesIgnoringSafeArea([.trailing, .leading, .bottom])
            
            VStack {
                TopButtonsStackView(leftIcon: .goBack,
                                    actionForSettings: { showingSettingsView.toggle() },
                                    actionForLeftButton: { viewManager.didUserTapGoBackToHomePage() })
                    .padding(paddings)
                Spacer()
            }
            
            ForEach(0..<levelManager.allLevels.count, id: \.self) { index in
                let level = levelManager.allLevels[index]
                LevelButton(position: level.position ,
                            didUserTap: {
                    levelManager.didUserTap(level: index)
                    viewManager.didUserTapToStartGame()
   
                }, title: "\(index+1)", level: level.status)
            }
            
            if showingSettingsView {
                SettingsMenuView() {
                    showingSettingsView = false
                }
            }
        }
        .ignoresSafeArea(.all)
        .navigationBarBackButtonHidden(true)
    }
}


struct LevelPage_Previews : PreviewProvider {
    static var previews: some View {
        LevelPage()
    }
}
