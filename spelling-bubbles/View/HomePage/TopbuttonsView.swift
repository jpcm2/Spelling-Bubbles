//
//  TopbuttonsView.swift
//  spelling-bubbles
//
//  Created by Lucas Migge de Barros on 25/10/22.
//

import Foundation
import SwiftUI

struct TopButtonsStackView : View {
    
    var actionForSettings : HandleWithButtonAction
    
    struct Constants {
        static let MAP_ICON = "map Icon"
        static let SETTINGS_ICON = "settings-button"
    }
    
    
    var body : some View {
        HStack(alignment: .center){
            Button(action: {

            }) {
                Image(Constants.MAP_ICON)
                    .renderingMode(Image.TemplateRenderingMode?.init(Image.TemplateRenderingMode.original))
            }
            
            Spacer()
            
            Button(action: {
                actionForSettings()
                
            }, label: {
                Image(Constants.SETTINGS_ICON)
                    .renderingMode(Image.TemplateRenderingMode?.init(Image.TemplateRenderingMode.original))
            })
        }
    }
}

