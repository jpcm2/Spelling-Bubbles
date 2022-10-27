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
            }
            .padding()
        }
    }
    
}
