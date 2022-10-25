//
//  IconAndLabelView.swift
//  spelling-bubbles
//
//  Created by Lucas Migge de Barros on 24/10/22.
//

import Foundation
import SwiftUI

struct IconAndLabelStackView : View {
    
    var actionForButton : HandleWithButtonAction
    var imageString : String
    var textString : String
    
    var body: some View {
        VStack{
            Button(action: {
                actionForButton()
                
            }) {
                Image(imageString)
                    .renderingMode(Image.TemplateRenderingMode?.init(Image.TemplateRenderingMode.original))
            }
            .padding()
            Text(textString)
        }
    }
}
