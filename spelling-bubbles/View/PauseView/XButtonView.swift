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
        HStack() {
            Spacer()
            Button(action: {
                actionXButton()
                presentationMode.wrappedValue.dismiss()
            }) {
                Image(ImageConstants.X_BUTTON)
                    .renderingMode(Image.TemplateRenderingMode?.init(Image.TemplateRenderingMode.original))
                    .padding(.bottom, 20.0)
            }
        }.padding([.top, .bottom, .trailing], 40.0)
        
    }
}
