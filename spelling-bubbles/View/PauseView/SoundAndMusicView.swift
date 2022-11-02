//
//  SoundAndMusicView.swift
//  spelling-bubbles
//
//  Created by Lucas Migge de Barros on 24/10/22.
//

import Foundation
import SwiftUI


struct SoundAndMusicView : View {
    
    
    
    var body: some View {
        HStack(alignment: .center){
            VStack{
                Button(action: {
                    print("button pressed")
                    
                }) {
                    Image(PauseMenuView.Constants.MUSIC_BUTTON)
                        .renderingMode(Image.TemplateRenderingMode?.init(Image.TemplateRenderingMode.original))
                }
                
                Text("Música")
                    .fontWeight(.medium)
                    .foregroundColor(Color(PauseMenuView.Constants.TEXT_COLOR))
            }
            .padding()
            
            VStack{
                Button(action: {
                    print("button pressed")
                    
                }) {
                    Image(PauseMenuView.Constants.SOUND_BUTTON)
                        .renderingMode(Image.TemplateRenderingMode?.init(Image.TemplateRenderingMode.original))
                }
                
                Text("Som")
                    .fontWeight(.medium)
                    .foregroundColor(Color(PauseMenuView.Constants.TEXT_COLOR))
            }
            .padding()
        }
    }
    
}
