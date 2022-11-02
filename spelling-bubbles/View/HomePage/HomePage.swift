//
//  HomePage.swift
//  spelling-bubbles
//
//  Created by Lucas Migge de Barros on 25/10/22.
//

import Foundation
import SwiftUI

struct HomePageView : View {
    
    @EnvironmentObject private var viewManager: ViewManager
    
    @State var showingSettingsView = false
    @State var animatingg = false
    
    struct Constants {
        static let PAUSE_MENU_BACKGROUND = "HomePageBackground"
        static let MAP_ICON = "map Icon"
        static let SETTINGS_ICON = "settings-button"
        static let LOGO_ICON = "Logo 1"
        static let START_ICON = "Start Icon"
        static let WOOD = "floating-wood"
        static let WAVE_1 = "waves-1"
        static let WAVE_2 = "waves-2"
    }
    
    var body: some View {
        ZStack{
            Image(Constants.PAUSE_MENU_BACKGROUND)
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            HomePageWoodAndWaves()
            
            PlantsViews()
            
            VStack(alignment: .center){
                TopButtonsStackView(
                    leftIcon: .map,
                    actionForSettings: {
                        showingSettingsView = true
                    },
                    actionForLeftButton: {
                        viewManager.didUserTapStartButton()
                        print ("clicou no mapa")
                    })
                .padding(.horizontal, CGFloat(14.HAdapted))
                .padding(.top, CGFloat(47.VAdapted))
                
                Spacer()
            }
            
            LogoAndStartButtonView() {
                viewManager.didUserTapStartButton()
            }
            .padding()
            
            if showingSettingsView {
                SettingsMenuView() {
                    showingSettingsView = false
                }
            }
            
        }
    }
}





struct HomePageView_Previews : PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}


