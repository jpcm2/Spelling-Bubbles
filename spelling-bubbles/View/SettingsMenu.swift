//
//  SettingsMenu.swift
//  spelling-bubbles
//
//  Created by Lucas Migge de Barros on 22/10/22.
//

import Foundation

import SwiftUI

struct SettingsMenuView : View {
    
    var body: some View {
        ZStack{
            Color("PauseMenuBackground")
                .frame(width: 332.HAdapted, height: 550.VAdapted, alignment: .center)
                .cornerRadius(20)
                .padding()
            
            VStack(spacing: 30) {
                HStack() {
                    Spacer()
                    Button(action: {
                        print("button pressed")
                        
                    }) {
                        Image(ImageConstants.X_BUTTON)
                            .renderingMode(Image.TemplateRenderingMode?.init(Image.TemplateRenderingMode.original))
                            .padding(.bottom, 20.0)
                    }
                }.padding([.top, .bottom, .trailing], 50.0)
                
                Text("Settings")
                    .font(.system(size: 36, weight: .regular, design: .rounded))
                    .padding()
                
                
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
                
            }
        }
    }
}


struct SettingsMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsMenuView()
    }
}
