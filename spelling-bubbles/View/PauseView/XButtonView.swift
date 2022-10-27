//
//  XButtonView.swift
//  spelling-bubbles
//
//  Created by Lucas Migge de Barros on 24/10/22.
//

import Foundation
import SwiftUI

struct XButtonView: View {
    
    @Environment(\.presentationMode) var presentationMode
    var actionXButton: HandleWithButtonAction
    
    var body: some View {
        
        Button(action: {
            actionXButton()
            
        }, label: {
            Image(PauseMenuView.Constants.CLOSE_BUTTON)
                .renderingMode(Image.TemplateRenderingMode?.init(Image.TemplateRenderingMode.original))
        })
        .frame(width: 59.HAdapted, height: 54.VAdapted)
        .position(x: 310.HAdapted, y: 170.VAdapted)
        
    }
}
