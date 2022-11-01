//
//  LevelFailed.swift
//  spelling-bubbles
//
//  Created by Lucas Migge de Barros on 31/10/22.
//

import Foundation
import SwiftUI

struct LevelFailedView : View {
    
    @State var animating = false
    
    var actionForRestart : HandleWithButtonAction
    var actionForMenu : HandleWithButtonAction
    
    struct Constants {
        static let FAIL_FRAME = "failed-frame 1"
        static let SHINE = "brilho"
        static let EMBLEM_CAPI = "emblema-capivara"
        static let EMBLEM_ARATU = "emblema-aratu"
        static let EMBLEM_FLOWER = "emblema-flor"
        static let EMBLEM_FOOT = "emblema-pegada"
        static let RESTART_BUTTON = "restart-button"
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
            Image(Constants.FAIL_FRAME)
                .resizable()
                .scaledToFit()
                .frame(width: 332.HAdapted,
                       height: 497.VAdapted)
            
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
                    
                    Text("Fracasso")
                        .font(.system(size: 36.VAdapted, weight: .medium))
                }

                BottomButtons(upperButtonIconSring: Constants.RESTART_BUTTON,
                              underButtonIconString: Constants.MENU_BUTTON,
                              upperActionButton: actionForRestart,
                              underActionButton: actionForMenu)
            }
            .padding(.bottom)
        }
    }
}

struct LevelFailedView_PreviewProvider : PreviewProvider {
    static var previews : some View {
        LevelFailedView(actionForRestart: {}, actionForMenu: {})
    }
}
