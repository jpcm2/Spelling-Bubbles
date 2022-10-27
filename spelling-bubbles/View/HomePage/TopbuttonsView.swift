//
//  TopbuttonsView.swift
//  spelling-bubbles
//
//  Created by Lucas Migge de Barros on 25/10/22.
//

import Foundation
import SwiftUI

struct TopButtonsStackView : View {
    
    struct Constants {
        static let MAP_ICON = "map Icon"
        static let SETTINGS_ICON = "settings-button"
    }
    
    var body : some View {
        HStack(alignment: .top){
            Button(action: {
               print("map button pressed")
            }) {
                Image(Constants.MAP_ICON)
                    .renderingMode(Image.TemplateRenderingMode?.init(Image.TemplateRenderingMode.original))
            }
            Spacer()
            Button(action: {
                print("Settings button Pressed")
            }, label: {
                Image(Constants.SETTINGS_ICON)
                    .renderingMode(Image.TemplateRenderingMode?.init(Image.TemplateRenderingMode.original))
            })
        }
    }
}

