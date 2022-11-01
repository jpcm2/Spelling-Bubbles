//
//  WoodAndWaves.swift
//  spelling-bubbles
//
//  Created by Lucas Migge de Barros on 31/10/22.
//

import Foundation
import SwiftUI

struct HomePageWoodAndWaves : View {
   
    @State var animatingg = false
    
    var body : some View {
        
        ZStack{
            Image(HomePageView.Constants.WAVE_1)
                .resizable()
                .scaledToFit()
                .frame(height: 100.VAdapted)
                .opacity(animatingg ? 0.4 : 1)
                .position(x: 100.HAdapted,
                          y: 200.VAdapted)
                .opacity(animatingg ? 0 : 100)
                .offset(x: animatingg ? 500.HAdapted : -100.HAdapted,
                        y: animatingg ? 200.VAdapted : -100.VAdapted)
                .animation(Animation.linear(duration: 20).repeatForever(autoreverses: false), value: animatingg)
            
            Image(HomePageView.Constants.WAVE_1)
                .resizable()
                .scaledToFit()
                .frame(height: 100.VAdapted)
                .opacity(animatingg ? 1 : 0)
                .position(x: 100.HAdapted,
                          y: 200.VAdapted)
                .opacity(animatingg ? 0 : 100)
                .offset(x: animatingg ? 500.HAdapted : -100.HAdapted,
                        y: animatingg ? 200.VAdapted : -100.VAdapted)
                .animation(Animation.linear(duration: 20).repeatForever(autoreverses: false).delay(10), value: animatingg)
                
                
            Image(HomePageView.Constants.WAVE_2)
                .resizable()
                .scaledToFit()
                .frame(height: 100.VAdapted)
                .opacity(animatingg ? 1 : 0)
                .position(x: 100.HAdapted,
                          y: 200.VAdapted)
                .opacity(animatingg ? 0 : 100)
                .offset(x: animatingg ? 300.HAdapted : -70.HAdapted,
                        y: animatingg ? 500.VAdapted : 350.VAdapted)
                .animation(Animation.easeIn(duration: 10).repeatForever(autoreverses: false), value: animatingg)
            
            Image(HomePageView.Constants.WAVE_2)
                .resizable()
                .scaledToFit()
                .frame(height: 100.VAdapted)
                .opacity(animatingg ? 1 : 0)
                .position(x: 100.HAdapted,
                          y: 200.VAdapted)
                .opacity(animatingg ? 0 : 100)
                .offset(x: animatingg ? 300.HAdapted : -70.HAdapted,
                        y: animatingg ? 500.VAdapted : 350.VAdapted)
                .animation(Animation.easeIn(duration: 10).repeatForever(autoreverses: false).delay(5), value: animatingg)
               
            Image(HomePageView.Constants.WOOD)
                .resizable()
                .scaledToFit()
                .frame(height: 100.VAdapted)
                .position(x: -100.HAdapted,
                          y: -200.VAdapted)
                .offset(x: animatingg ? 550.HAdapted : -100.HAdapted,
                        y: animatingg ? 700.VAdapted : 200.VAdapted)
                .animation(Animation.easeInOut(duration: 15).repeatForever(autoreverses: false), value: animatingg)
        }.onAppear{
            animatingg = true
        }
    
    }
}

struct HomePageWoodAndWaves_ContentPreview : PreviewProvider {
    static var previews : some View {
        HomePageWoodAndWaves()
    }
}
