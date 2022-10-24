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
    
    struct Constants {
        static let PAUSE_MENU_BACKGROUND = "PauseMenuBackground"
    }
    
    var body: some View {
        ZStack{
            Color(Constants.PAUSE_MENU_BACKGROUND)
                .frame(width: 332.HAdapted, height: 550.VAdapted, alignment: .center)
                .cornerRadius(20)
                .padding()
            
            VStack() {
                
                XButtonView() {
                    actionXButton()
                }
                PauseLabelView()
                SoundAndMusicView()
                BottomButtons()
                
            }
            .padding()
        }
    }
    
}


struct PauseMenuView_Previews: PreviewProvider {
    static var previews: some View {
        PauseMenuView() {}
    }
}
