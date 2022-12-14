//
//  LevelCompleteView.swift
//  spelling-bubbles
//
//  Created by Lucas Migge de Barros on 30/10/22.
//

import Foundation
import SwiftUI

struct LevelCompleteView : View {
    
    @State var animating = false
    
    var actionForNextLevel : HandleWithButtonAction
    var actionForMenu : HandleWithButtonAction
    
    struct Constants {
        static let TEXT_COLOR = "TextColor"
        static let SHINE = "brilho"
        static let EMBLEM_CAPI = "emblema-capivara"
        static let EMBLEM_ARATU = "emblema-aratu"
        static let EMBLEM_FLOWER = "emblema-flor"
        static let EMBLEM_FOOT = "emblema-pegada"
        static let NEXT_LEVEL = "nextlevel-button"
        static let VICTORY_FRAME = "vitory-frame 1"
        static let MENU_BUTTON = "menu-button"
    }
    
    private let emblems = [
        Constants.EMBLEM_ARATU,
        Constants.EMBLEM_CAPI,
        Constants.EMBLEM_FOOT,
        Constants.EMBLEM_FLOWER
    ]
    
    var body: some View {
        ZStack{
            Image(Constants.VICTORY_FRAME)
                .resizable()
                .scaledToFit()
                .frame(width: 332.HAdapted,
                       height: 567.VAdapted)
            
            VStack(alignment: .center, spacing: 15.VAdapted){
                
                VStack(spacing: -35.VAdapted){
                    ZStack{
                        Image(Constants.SHINE)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 280.HAdapted, height: 280.VAdapted)
                            .rotationEffect(Angle(degrees: animating ? 360 : 0))
                            .animation(Animation.linear(duration: 20).repeatForever(autoreverses: false), value: animating)
                            .onAppear {
                                animating = true
                            }
                        
                        Image(emblems.randomElement()!)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200.HAdapted, height: 200.VAdapted)
                    }
                    
                    Text("MUITO BEM!")
                        .font(.system(size: 42.VAdapted, weight: .medium))
                }
                .padding()
                
                BottomButtons(upperButtonIconSring: Constants.NEXT_LEVEL,
                              underButtonIconString: Constants.MENU_BUTTON,
                              upperActionButton: actionForNextLevel,
                              underActionButton: actionForMenu)
            }
            .padding(.top)
        }
    }
}

struct LevelCompleteView_PreviewProvider : PreviewProvider {
    static var previews : some View {
        LevelCompleteView(actionForNextLevel: {}, actionForMenu: {})
    }
}
