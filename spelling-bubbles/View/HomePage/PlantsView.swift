//
//  PlantsView.swift
//  spelling-bubbles
//
//  Created by Lucas Migge de Barros on 25/10/22.
//

import Foundation
import SwiftUI

struct PlantsViews : View {
    
    struct Constants {
        static let PLANT_IMAGE_1 = "plant1"
        static let PLANT_IMAGE_2 = "plant2"
        static let PLANT_IMAGE_3 = "plant3"
        static let PLANT_IMAGE_4 = "plant4"
        static let SCREEN_WIDTH = UIScreen.main.bounds.width
        static let SCREEN_HEIGHT = UIScreen.main.bounds.height
        
    }
    
    @State var isAnimating = false
    
    
    var body: some View {
        ZStack{
            Image(Constants.PLANT_IMAGE_1)
                .resizable()
                .scaledToFit()
                .frame(width: 187.VAdapted)
                .position(x: 80.HAdapted, y: 85.VAdapted)
                .rotationEffect(Angle(degrees: self.isAnimating ? 2: -2), anchor: .topLeading)
                .animation(Animation.linear(duration: 5).repeatForever(), value: isAnimating)
            
            
            Image(Constants.PLANT_IMAGE_2)
                .resizable()
                .scaledToFit()
                .frame(width: 51.VAdapted)
                .position(x: Constants.SCREEN_WIDTH - 15.HAdapted, y: 151.VAdapted)
                .rotationEffect(Angle(degrees: self.isAnimating ? 1: -1), anchor: .center)
                .animation(Animation.linear(duration: 4).repeatForever(), value: isAnimating)
            
            
            Image(Constants.PLANT_IMAGE_3)
                .resizable()
                .scaledToFit()
                .frame(width: 46.VAdapted)
                .position(x: 18.HAdapted, y: Constants.SCREEN_HEIGHT - 30.VAdapted)
                .rotationEffect(Angle(degrees: self.isAnimating ? -1: 1), anchor: .bottomLeading)
                .animation(Animation.linear(duration: 1).repeatForever(), value: isAnimating)
            
            
            Image(Constants.PLANT_IMAGE_4)
                .resizable()
                .scaledToFit()
                .frame(width: 187.VAdapted)
                .position(x: Constants.SCREEN_WIDTH - 80.HAdapted, y: Constants.SCREEN_HEIGHT - 85.VAdapted)
                .rotationEffect(Angle(degrees: self.isAnimating ? -2: 2), anchor: .bottomTrailing)
                .animation(Animation.linear(duration: 4).repeatForever(), value: isAnimating)
            
        }
        .ignoresSafeArea()
        .onAppear{
            isAnimating.toggle()
        }
    }
    
}

struct PlantsView : PreviewProvider {
    static var previews: some View {
        PlantsViews()
    }
}
