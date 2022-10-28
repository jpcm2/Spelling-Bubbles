//
//  TopbuttonsView.swift
//  spelling-bubbles
//
//  Created by Lucas Migge de Barros on 25/10/22.
//

import Foundation
import SwiftUI

struct TopButtonsStackView : View {
    
    var leftIcon: TypeLeftButton
    var actionForSettings : HandleWithButtonAction
    var actionForLeftButton: HandleWithButtonAction

    
    struct Constants {
        static let MAP_ICON = "map Icon"
        static let SETTINGS_ICON = "settings-button"
        static let GO_BACK_BUTTON = "back-button"
    }
    
    enum TypeLeftButton: String {
        case map = "map Icon"
        case goBack = "back-button"
    }
    
    
    init(leftIcon: TypeLeftButton,
         actionForSettings: @escaping HandleWithButtonAction,
         actionForLeftButton: @escaping HandleWithButtonAction) {
        
        self.leftIcon = leftIcon
        self.actionForSettings = actionForSettings
        self.actionForLeftButton = actionForLeftButton
    }
    

    var body : some View {
        HStack(alignment: .top){
            Button(action: {
                actionForLeftButton()
            }) {
                Image(leftIcon.rawValue)
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

