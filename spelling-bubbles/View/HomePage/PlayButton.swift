//
//  PlayButton.swift
//  spelling-bubbles
//
//  Created by alexdamascena on 01/11/22.
//

import Foundation
import SwiftUI

struct PlayButton : View {
    
    private struct Constants {
        static let LEFT_ARM_TURTLE = "L1-turtle"
        static let LEFT_ARM_TURTLE_2 = "L2-turtle"
        static let RIGHT_ARM_TURTLE = "R1-turtle"
        static let RIGHT_ARM_TURTLE_2 = "R2-turtle"
    }
    
    var midScreenWidth: CGFloat {
        return UIScreen.main.bounds.width/2
    }
    
    @State var showTurtle = false

    var body : some View {
    
        ZStack{
            Image(HomePageView.Constants.START_ICON)
                .onTapGesture{
                    withAnimation(Animation.easeIn(duration: 1.5)) {
                        showTurtle.toggle()
                    }
                }
            
            Image(Constants.LEFT_ARM_TURTLE)
                .resizable()
                .frame(width: 45, height: 60)
                .position(x: midScreenWidth + 35.HAdapted, y: 323)
                .zIndex(-1)
                .opacity(showTurtle ? 1 : 0.0)
            
            Image(Constants.LEFT_ARM_TURTLE_2)
                .resizable()
                .frame(width: 35, height: 40)
                .position(x: midScreenWidth - 35.HAdapted, y: 323)
                .zIndex(-1)
                .opacity(showTurtle ? 1 : 0.0)
            
            Image(Constants.RIGHT_ARM_TURTLE)
                .resizable()
                .frame(width: 45, height: 60)
                .position(x: midScreenWidth + 35.HAdapted, y: 435)
                .opacity(showTurtle ? 1 : 0.0)
                .zIndex(-1)
            
            Image(Constants.RIGHT_ARM_TURTLE_2)
                .resizable()
                .frame(width: 40, height: 35)
                .position(x: midScreenWidth - 35.HAdapted, y: 435)
                .opacity(showTurtle ? 1 : 0.0)
                .zIndex(-1)
                
        }
        
    }
}

struct PlayButton_ContentPreview : PreviewProvider {
    static var previews : some View {
        PlayButton()
    }
}
