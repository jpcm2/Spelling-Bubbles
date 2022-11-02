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
    @State var showTurtle = false
    
    private let turtle = PlayButton()
    
    var body: some View {
        VStack(alignment: .center){
            Image(HomePageView.Constants.LOGO_ICON)
                .resizable()
                .scaledToFit()
                .padding()
            
            if showTurtle {
                turtle
                    .transition(.opacity)
            }
            
            if !showTurtle {
                Button(action: {
                    withAnimation(.linear(duration: 2.5)){
                        showTurtle.toggle()
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 10.5) {
                        actionForStartButton()
                    }
                }, label: {
                    Image(HomePageView.Constants.START_ICON)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 137.HAdapted,height: 112.VAdapted)
                })
                
            }
        

        }
        .padding()
    }
}
