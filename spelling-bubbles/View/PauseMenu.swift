//
//  PauseMenu.swift
//  spelling-bubbles
//
//  Created by Lucas Migge de Barros on 22/10/22.
//

import Foundation
import SwiftUI

struct PauseMenuView : View {
    
    var body: some View {
        ZStack{
            Color(.cyan) //backgrund
            VStack() {
                HStack() {
                    Spacer()
                    Button(action: {
                        print("button pressed")
                        
                    }) {
                        Image(ImageConstants.X_BUTTON)
                            .renderingMode(Image.TemplateRenderingMode?.init(Image.TemplateRenderingMode.original))
                    }
                }.padding([.top, .bottom, .trailing], 31.0)
                HStack{
                    Image(systemName: "pause.fill")
                    Text("Pause")
                        
                        .font(.body)
                        .fontWeight(.regular)
                }
                HStack{
                    VStack{
                        Button(action: {
                            print("button pressed")
                            
                        }) {
                            Image(ImageConstants.MUSIC_ICON)
                                .renderingMode(Image.TemplateRenderingMode?.init(Image.TemplateRenderingMode.original))
                        }
                        .padding()
                        Text("Music")
                    }
                    VStack{
                        Button(action: {
                            print("button pressed")
                            
                        }) {
                            Image(ImageConstants.SOUND_ICON)
                                .renderingMode(Image.TemplateRenderingMode?.init(Image.TemplateRenderingMode.original))
                        }
                        .padding()
                        Text("Sounds")
                    }
                }
                .padding()
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
                    }                }
            }
            .padding()
        }
    }
    
}


struct PauseMenuView_Previews: PreviewProvider {
    static var previews: some View {
        PauseMenuView()
    }
}
