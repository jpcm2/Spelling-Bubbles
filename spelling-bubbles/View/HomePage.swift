//
//  HomePage.swift
//  spelling-bubbles
//
//  Created by Lucas Migge de Barros on 25/10/22.
//

import Foundation
import SwiftUI

struct HomePageView : View {
    
    struct Constants {
        static let PAUSE_MENU_BACKGROUND = "HomePageBackground"
        static let MAP_ICON = "map Icon"
        static let SETTINGS_ICON = "settings-button"
        static let START_ICON = "Start Icon"
    }
    
    var body: some View {
        ZStack{
            Image(Constants.PAUSE_MENU_BACKGROUND)
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            PlantsViews()

            
            VStack(alignment: .center){
               TopButtonsStackView()
                    .ignoresSafeArea()
                    .padding(.horizontal, CGFloat(14.HAdapted))
                    .padding(.top, CGFloat(35.VAdapted))
                Spacer()

            }
            .padding(11.0)
            
            LogoAndStartButtonView()
        }
    }
}

struct LogoAndStartButtonView : View {
    
    struct Constants {
        static let PAUSE_MENU_BACKGROUND = "HomePageBackground"
        static let MAP_ICON = "map Icon"
        static let SETTINGS_ICON = "settings-button"
        static let START_ICON = "Start Icon"
    }
    
    var body: some View {
        VStack(alignment: .center){
            Image(systemName: "star.fill")
            Button(action: {
                print("starIcon pressed")
            }, label: {
                Image(Constants.START_ICON)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 137.HAdapted,height: 112.VAdapted)
            }
            )
        }
    }
}

struct HomePageView_Previews : PreviewProvider {
    static var previews: some View {
        HomePageView() 
    }
}

struct PlantsViews : View {
    
    struct Constants {
        static let PAUSE_MENU_BACKGROUND = "HomePageBackground"
        static let PLANT_IMAGE_1 = "plant1"
        static let PLANT_IMAGE_2 = "plant2"
        static let PLANT_IMAGE_3 = "plant3"
        static let PLANT_IMAGE_4 = "plant4"
        static let SCREEN_WIDTH = UIScreen.main.bounds.width
        static let SCREEN_HEIGHT = UIScreen.main.bounds.height
    }
    
    var body: some View {
        Image(Constants.PLANT_IMAGE_1)
            .resizable()
            .scaledToFit()
            .frame(width: 156.VAdapted, height: 147.VAdapted)
            .position(x: 70.HAdapted, y: 50.VAdapted)
            
            
        Image(Constants.PLANT_IMAGE_2)
            .resizable()
            .scaledToFit()
            .frame(width: 43.VAdapted, height: 68.VAdapted)
            .position(x: Constants.SCREEN_WIDTH - 20.HAdapted, y: 151.VAdapted)
        
        Image(Constants.PLANT_IMAGE_3)
            .resizable()
            .scaledToFit()
            .frame(width: 39.VAdapted, height: 60.VAdapted)
            .position(x: 18.HAdapted, y: Constants.SCREEN_HEIGHT - 45.VAdapted)
        
        Image(Constants.PLANT_IMAGE_4)
            .resizable()
            .scaledToFit()
            .frame(width: 156.VAdapted, height: 147.VAdapted)
            .position(x: Constants.SCREEN_WIDTH - 73.HAdapted, y: Constants.SCREEN_HEIGHT - 80.VAdapted)
    }
}

struct TopButtonsStackView : View {
    struct Constants {
        static let PAUSE_MENU_BACKGROUND = "HomePageBackground"
        static let MAP_ICON = "map Icon"
        static let SETTINGS_ICON = "settings-button"
        static let START_ICON = "Start Icon"
    }
    
    
    var body : some View {
        HStack(alignment: .center){
            Button(action: {
               print("map button pressed")
            }) {
                Image(Constants.MAP_ICON)
                    .renderingMode(Image.TemplateRenderingMode?.init(Image.TemplateRenderingMode.original))
            }
            Spacer()
            Button(action: {
                print("Settings button Pressed")
            }, label: {
                Image(Constants.SETTINGS_ICON)
                    .renderingMode(Image.TemplateRenderingMode?.init(Image.TemplateRenderingMode.original))
            })
        }
    }
}
