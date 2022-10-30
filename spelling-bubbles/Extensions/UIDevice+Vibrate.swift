//
//  UIDevice+Vibrate.swift
//  spelling-bubbles
//
//  Created by jpcm2 on 29/10/22.
//

import Foundation


import AudioToolbox
import UIKit

extension UIDevice {
    static func Vibrate(){
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
    }
}
