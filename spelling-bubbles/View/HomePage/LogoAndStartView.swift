//
//  LogoAndStartView.swift
//  spelling-bubbles
//
//  Created by Lucas Migge de Barros on 25/10/22.
//

import Foundation
import SwiftUI

struct LogoAndStartButtonView : View {
    
    var actionForStartButton : HandleWithButtonAction
    
    @State var isAnimating = false
    
    var body: some View {
        VStack(alignment: .center){
            Image(HomePageView.Constants.LOGO_ICON)
                .resizable()
                .scaledToFit()
                .padding()
            
            
            Button(action: {
                print("starIcon pressed")
                actionForStartButton()
                
            }, label: {
                Image(HomePageView.Constants.START_ICON)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 137.HAdapted,height: 112.VAdapted)
            }
            )
    
            
        }
        .padding()
    }
}
