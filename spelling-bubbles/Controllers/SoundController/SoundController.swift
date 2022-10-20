//
//  SoundController.swift
//  spelling-bubbles
//
//  Created by jpcm2 on 20/10/22.
//

import Foundation
import AVFoundation

class SoundController {
    
    // Listar os links pros assets
    let mainMusicName: String?
    let mainMusicType: String?
    var mainMusicAudioPlayer: AVAudioPlayer = AVAudioPlayer()
    
    init(mainMusicName: String, mainMusicType: String){
        self.mainMusicName = mainMusicName
        self.mainMusicType = mainMusicType
    }
    
    struct Constants {
        static let mainMusicVolume = 0.5
    }
        
    func playMainMusic(){
        guard let path = Bundle.main.path(forResource: mainMusicName, ofType: mainMusicType) else {return}
        do {
            mainMusicAudioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            mainMusicAudioPlayer.numberOfLoops = -1
            mainMusicAudioPlayer.volume = Float(Constants.mainMusicVolume)
            mainMusicAudioPlayer.play()
        }catch{
            print("ERROR: Could not find and play the sound file")
        }
    }
}
