//
//  bottomButtons.swift
//  spelling-bubbles
//
//  Created by Lucas Migge de Barros on 24/10/22.
//

import Foundation
import SwiftUI

struct BottomButtons : View {
    
    var upperButtonIconSring : String
    var underButtonIconString : String
    
    var upperActionButton : HandleWithButtonAction
    var underActionButton : HandleWithButtonAction
    
    var body: some View {
        VStack{
            Button(action: {
                print("button pressed")
                upperActionButton()
                
            }) {
                Image(upperButtonIconSring)
                    .renderingMode(Image.TemplateRenderingMode?.init(Image.TemplateRenderingMode.original))
            }
            
            Button(action: {
                print("button pressed")
                underActionButton()
                
            }) {
                Image(underButtonIconString)
                    .renderingMode(Image.TemplateRenderingMode?.init(Image.TemplateRenderingMode.original))
            }
        }
    }
}
