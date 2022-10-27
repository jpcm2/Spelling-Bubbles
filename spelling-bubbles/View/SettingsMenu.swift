//
//  SettingsMenu.swift
//  spelling-bubbles
//
//  Created by Lucas Migge de Barros on 22/10/22.
//

import Foundation
import SwiftUI

struct SettingsMenuView : View {
    
    var actionCloseButton : HandleWithButtonAction
    
    struct Constants {
        static let CLOSE_BUTTON = "close-button"
        static let MORE_GAMES = "moregames-button"
        static let MUSIC_BUTTON = "music-button"
        static let SOUND_BUTTON = "soundeffects-button"
        static let BACKGROUND_IMAGE = "settignsBackgroundView"
        static let SITE_BUUTTON = "site-button"
    }
    
    var body: some View {
        
        ZStack{
            Image(Constants.BACKGROUND_IMAGE)
                .resizable()
                .scaledToFit()
                .frame(width: 332.HAdapted, height: 477.VAdapted)
                
            
            
            Button(action: {
                actionCloseButton()
                
            }, label: {
                Image(Constants.CLOSE_BUTTON)
                    .renderingMode(Image.TemplateRenderingMode?.init(Image.TemplateRenderingMode.original))
                    .frame(width: 59.HAdapted, height: 54.VAdapted)
                    .position(x: 310.HAdapted, y: 140.VAdapted)}
            )
            
            
            
            VStack(alignment: .center) {

                Text("Settings")
                    .font(.system(size: 36, weight: .regular, design: .rounded))
                    .padding()
                
                VStack(alignment: .center){
                    
                    HStack(alignment: .center){
                        VStack{
                            Button(action: {
                                print("button pressed")
                                
                            }) {
                                Image(Constants.MUSIC_BUTTON)
                                    .renderingMode(Image.TemplateRenderingMode?.init(Image.TemplateRenderingMode.original))
                            }
                            
                            Text("Music")
                        }
                        .padding()
                        
                        VStack{
                            Button(action: {
                                print("button pressed")
                                
                            }) {
                                Image(Constants.SOUND_BUTTON)
                                    .renderingMode(Image.TemplateRenderingMode?.init(Image.TemplateRenderingMode.original))
                            }
                            
                            Text("Sounds")
                        }
                        .padding()
                    }
                    .padding(.horizontal, 1.0)
                    
                    VStack{
                        Button(action: {
                            print("button pressed")
                            
                        }) {
                            Image(Constants.MORE_GAMES)
                                .renderingMode(Image.TemplateRenderingMode?.init(Image.TemplateRenderingMode.original))
                        }
                        
                        Button(action: {
                            print("button pressed")
                            
                        }) {
                            Image(Constants.SITE_BUUTTON)
                                .renderingMode(Image.TemplateRenderingMode?.init(Image.TemplateRenderingMode.original))
                        }
                    }
                }
                
                .padding()
                
            }
        }
    }
}

struct SettingsMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsMenuView() {
            
        }
    }
}
