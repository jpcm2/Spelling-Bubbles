//
//  bottomButtons.swift
//  spelling-bubbles
//
//  Created by Lucas Migge de Barros on 24/10/22.
//

import Foundation
import SwiftUI

struct BottomButtons : View {
    
    var actionForRestart : HandleWithButtonAction
    var actionForMenu : HandleWithButtonAction
    
    var body: some View {
        VStack{
            Button(action: {
                print("button pressed")
                actionForRestart()
                
            }) {
                Image(PauseMenuView.Constants.RESTART_BUTTON)
                    .renderingMode(Image.TemplateRenderingMode?.init(Image.TemplateRenderingMode.original))
            }
            
            Button(action: {
                print("button pressed")
                actionForMenu()
                
            }) {
                Image(PauseMenuView.Constants.MENU_BUTTON)
                    .renderingMode(Image.TemplateRenderingMode?.init(Image.TemplateRenderingMode.original))
            }
        }
    }
}
