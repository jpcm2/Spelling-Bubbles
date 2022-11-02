//
//  PauseMenu.swift
//  spelling-bubbles
//
//  Created by Lucas Migge de Barros on 22/10/22.
//

import Foundation
import SwiftUI

typealias HandleWithButtonAction = (() -> Void)

struct PauseMenuView : View {
    
    var actionXButton: HandleWithButtonAction
    var actionMenuPressed : HandleWithButtonAction
    var actionRestartPressed : HandleWithButtonAction
    
    struct Constants {
        static let TEXT_COLOR = "TextColor"
        static let CLOSE_BUTTON = "close-button"
        static let MENU_BUTTON = "menu-button"
        static let MUSIC_BUTTON = "music-button"
        static let SOUND_BUTTON = "soundeffects-button"
        static let BACKGROUND_IMAGE = "settignsBackgroundView"
        static let RESTART_BUTTON = "restart-button"
        
    }
    
    var body: some View {
        ZStack{
            Image(Constants.BACKGROUND_IMAGE)
                .resizable()
                .scaledToFit()
                .frame(width: 332.HAdapted, height: 477.VAdapted)
            
            XButtonView(){
                actionXButton()
            }
            
            VStack(alignment: .center) {
                
                PauseLabelView()
                    .padding(.top, 50.VAdapted)
                
                VStack(alignment: .center, spacing: 20.VAdapted){
                    
                    SoundAndMusicView()
                        .padding(.horizontal, 1.0)
                    
                    BottomButtons(upperButtonIconSring: Constants.RESTART_BUTTON,
                                  underButtonIconString: Constants.MENU_BUTTON,
                                  upperActionButton: { actionRestartPressed()},
                                  underActionButton: { actionMenuPressed()}
                    )
                }
                .padding(.top, 40.0)
                
            }
        }
        
    }
    
}


struct PauseMenuView_Previews: PreviewProvider {
    static var previews: some View {
        PauseMenuView(actionXButton: {}, actionMenuPressed: {}, actionRestartPressed: {})
    }
}
