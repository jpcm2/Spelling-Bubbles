//
//  LogoAndStartView.swift
//  spelling-bubbles
//
//  Created by Lucas Migge de Barros on 25/10/22.
//

import Foundation
import SwiftUI

struct LogoAndStartButtonView : View {
    
    struct Constants {
        static let LOGO_ICON = "star.fill"
        static let START_ICON = "Start Icon"
    }
    
    @State var isAnimating = false
    
    var body: some View {
        VStack(alignment: .center){
            Image(systemName: Constants.LOGO_ICON)
            
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
