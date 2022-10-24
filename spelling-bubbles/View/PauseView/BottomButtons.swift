//
//  bottomButtons.swift
//  spelling-bubbles
//
//  Created by Lucas Migge de Barros on 24/10/22.
//

import Foundation
import SwiftUI

struct BottomButtons : View {
    
    var body: some View {
        VStack{
            Button(action: {
                print("button pressed")
                
            }) {
                Image(ImageConstants.RESTART_BUTTON)
                    .renderingMode(Image.TemplateRenderingMode?.init(Image.TemplateRenderingMode.original))
            }
            Button(action: {
                print("button pressed")
                
            }) {
                Image(ImageConstants.MENU_BUTTON)
                    .renderingMode(Image.TemplateRenderingMode?.init(Image.TemplateRenderingMode.original))
            }
            
        }
    }
}
