//
//  PlayButton.swift
//  spelling-bubbles
//
//  Created by alexdamascena on 01/11/22.
//

import Foundation
import SwiftUI

struct Turtle : View {
    
    @State var showTurtle = false
    @State private var isAnimating = false
    @State private var movingAllTurtle = false
    
    @State var spriteTurtle = TurtleSprite.first
    @State private var triggerToChangeShell = 0
    @State private var triggerMovingShell = 0
    
    @State private var offsetx: CGFloat = 0
    @State private var offsety: CGFloat = 0
    
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
        
    var body : some View {
    
        ZStack{
            Image( showTurtle ? spriteTurtle.rawValue : HomePageView.Constants.START_ICON)
                .resizable()
                .frame(width: 160, height: 110)
                .onChange(of: triggerToChangeShell, perform: { _ in
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                        self.spriteTurtle = self.spriteTurtle.next()
                        triggerToChangeShell += 1
                    }
                })
            
            Image(Constants.LEFT_ARM_TURTLE)
                .resizable()
                .frame(width: 45, height: 60)
                .position(x: 140 + 35, y: 50)
                .zIndex(-1)
                .rotationEffect(Angle(degrees: self.isAnimating ? 3: -3), anchor: .center)
                .animation(Animation.linear(duration: 2).repeatForever(), value: isAnimating)
            
            Image(Constants.LEFT_ARM_TURTLE_2)
                .resizable()
                .frame(width: 35, height: 40)
                .position(x: 140 - 35, y: 55)
                .zIndex(-1)
                .rotationEffect(Angle(degrees: self.isAnimating ? 3: -3), anchor: .center)
                .animation(Animation.linear(duration: 2).repeatForever(), value: isAnimating)
            
            Image(Constants.RIGHT_ARM_TURTLE)
                .resizable()
                .frame(width: 45, height: 60)
                .position(x: 140 + 35, y: 175)
                .zIndex(-1)
                .rotationEffect(Angle(degrees: self.isAnimating ? -3: 3), anchor: .center)
                .animation(Animation.linear(duration: 2).repeatForever(), value: isAnimating)
            
            Image(Constants.RIGHT_ARM_TURTLE_2)
                .resizable()
                .frame(width: 40, height: 35)
                .position(x: 140 - 35, y: 175)
                .zIndex(-1)
                .rotationEffect(Angle(degrees: self.isAnimating ? -3: 3), anchor: .center)
                .animation(Animation.linear(duration: 2).repeatForever(), value: isAnimating)
                .transition(.identity)
 
            
            Image(Constants.HEAD)
                .resizable()
                .frame(width: 100, height: 60)
                .position(x: 140 + 100, y: 125)
                .zIndex(-1)
                .rotationEffect(Angle(degrees: self.isAnimating ? -1: 1), anchor: .leading)
                .animation(Animation.linear(duration: 2).repeatForever(), value: isAnimating)
        }
        .frame(width: 280, height: 230)
        .rotationEffect(Angle(degrees: movingAllTurtle ? 10: 0), anchor: .leading)
        .animation(Animation.linear(duration: 2), value: movingAllTurtle)
        .onChange(of: triggerMovingShell, perform: { _ in
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                withAnimation {
                    offsetx += 8
                    offsety += 10
                    self.triggerMovingShell += 1
                }
            }
        })
        .offset(x: offsetx, y: offsety)
        .onAppear {
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                self.showTurtle = true
                triggerToChangeShell += 1
                self.isAnimating = true
                self.movingAllTurtle = true
                triggerMovingShell += 1
            }
 
        }
    }
}

struct Turtle_ContentPreview : PreviewProvider {
    static var previews : some View {
        Turtle()
    }
}
