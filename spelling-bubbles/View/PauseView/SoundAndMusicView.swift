//
//  SoundAndMusicView.swift
//  spelling-bubbles
//
//  Created by Lucas Migge de Barros on 24/10/22.
//

import Foundation
import SwiftUI


struct SoundAndMusicView : View {
    
    var body: some View {
        HStack{
            IconAndLabelStackView(actionForButton: {print("Action for this button")},
                                  imageString: ImageConstants.MUSIC_ICON,
                                  textString: "Music")
            
            IconAndLabelStackView(actionForButton: {print("Action for this other button")},
                                  imageString: ImageConstants.SOUND_ICON,
                                  textString: "Sounds")
            
        }
        .padding()
    }
    
}
