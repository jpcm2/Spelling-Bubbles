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
        static let TEXT_COLOR = "TextColor"
        static let FAIL_FRAME = "failed-frame 1"
        static let EMBLEM_FAILED = "crabInABottle"
        static let RESTART_BUTTON = "restart-button"
        static let MENU_BUTTON = "menu-button"
    }
    
    
    var body: some View {
        ZStack{
            Image(Constants.FAIL_FRAME)
                .resizable()
                .scaledToFit()
                .frame(width: 332.HAdapted,
                       height: 497.VAdapted)
            
            VStack(alignment: .center){
                
                Image(Constants.EMBLEM_FAILED)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 330.HAdapted)
                    .offset(x: -19.HAdapted)
                    .padding()
                
                Text("EITA POXA!")
                    .font(.system(size: 42.VAdapted, weight: .medium))
                    .foregroundColor(Color(Constants.TEXT_COLOR))
                    .padding()
                
                BottomButtons(upperButtonIconSring: Constants.RESTART_BUTTON,
                              underButtonIconString: Constants.MENU_BUTTON,
                              upperActionButton: actionForRestart,
                              underActionButton: actionForMenu)
            }
            .padding(.bottom)
            .offset(y: -40.VAdapted)

                
            }
        .padding()
        }
    }


struct LevelFailedView_PreviewProvider : PreviewProvider {
    static var previews : some View {
        LevelFailedView(actionForRestart: {}, actionForMenu: {})
    }
}
