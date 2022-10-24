//
//  PauseMenu.swift
//  spelling-bubbles
//
//  Created by Lucas Migge de Barros on 22/10/22.
//

import Foundation
import SwiftUI

typealias HandleWithPauseButtonAction = (() -> Void)

//struct XButton: View {
//    
//    var body: some View {
//        
//    }
//}

struct PauseMenuView : View {
    
    @Environment(\.presentationMode) var presentationMode
    var actionXButton: HandleWithPauseButtonAction
    
    struct Constants {
        static let PAUSE_MENU_BACKGROUND = "PauseMenuBackground"
    }
    

    var body: some View {
        ZStack{
            Color(Constants.PAUSE_MENU_BACKGROUND)
                .frame(width: 332.HAdapted, height: 550.VAdapted, alignment: .center)
                .cornerRadius(20)
                .padding()
            VStack() {
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
                          
                
                HStack(spacing: 18.0){
                    Image(systemName: "pause.fill")
                        .resizable()
                        .frame(width: 34,height: 35)
                        .scaledToFit()
                    Text("Pause")
                        .font(.system(size: 36, weight: .regular, design: .rounded))
                        
                }
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
        PauseMenuView() {}
    }
}
