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
        static let HEAD = "head-turtle"
        static let SHELL = "shell-click-3"
    }
    
    enum TurtleSprite: String {
        case first = "shell-click-1"
        case second = "shell-click-2"
        case third = "shell-click-3"
        case fourth = "shell-click-4"
        
        func next() -> TurtleSprite {
            switch self {
                case .first: return .second
                case .second: return .third
                case .third : return .fourth
                case .fourth: return .fourth
            }
        }
    }
    
    var midScreenWidth: CGFloat {
        return UIScreen.main.bounds.width/2
    }
    
    @State var showTurtle = false
    @State var spriteTurtle = TurtleSprite.first
    @State private var fadeOut = false

    var body : some View {
    
        ZStack{
            Image( showTurtle ? spriteTurtle.rawValue : HomePageView.Constants.START_ICON)
                .resizable()
                .frame(width: 160, height: 110)
                .animation(Animation.easeIn(duration: 0.25), value: fadeOut)
                .animation(Animation.linear(duration: <#T##Double#>))
                .onTapGesture{
                    self.fadeOut.toggle()
                    self.showTurtle = true
    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.25 ) {
                        withAnimation {
                            self.spriteTurtle = self.spriteTurtle.next()
                            self.fadeOut.toggle()
                        }
                    }
                }
            
            Image(Constants.LEFT_ARM_TURTLE)
                .resizable()
                .frame(width: 45, height: 60)
                .position(x: midScreenWidth + 35, y: 323)
                .zIndex(-1)
                .opacity(showTurtle ? 1 : 0.0)
            
            Image(Constants.LEFT_ARM_TURTLE_2)
                .resizable()
                .frame(width: 35, height: 40)
                .position(x: midScreenWidth - 35, y: 323)
                .zIndex(-1)
                .opacity(showTurtle ? 1 : 0.0)
            
            Image(Constants.RIGHT_ARM_TURTLE)
                .resizable()
                .frame(width: 45, height: 60)
                .position(x: midScreenWidth + 35, y: 435)
                .opacity(showTurtle ? 1 : 0.0)
                .zIndex(-1)
            
            Image(Constants.RIGHT_ARM_TURTLE_2)
                .resizable()
                .frame(width: 40, height: 35)
                .position(x: midScreenWidth - 35, y: 440)
                .opacity(showTurtle ? 1 : 0.0)
                .zIndex(-1)
            
            Image(Constants.HEAD)
                .resizable()
                .frame(width: 100, height: 60)
                .position(x: midScreenWidth + 100, y: 380)
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
