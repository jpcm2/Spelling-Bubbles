//
//  OnboardingView.swift
//  spelling-bubbles
//
//  Created by alexdamascena on 02/11/22.
//

import UIKit
import AVKit

class OnboardingView: UIView {

    private struct Constants {
        static let VIDEO_URL = URL(fileURLWithPath: Bundle.main.path(forResource: "onboarding", ofType: "mp4") ?? "")
    }
    
    private let player = AVPlayer(url: Constants.VIDEO_URL)
    private let playLayer = AVPlayerLayer()
    
    override init(frame: CGRect) {
      super.init(frame: frame)
        
      playLayer.player = player
        playLayer.videoGravity = .resizeAspectFill
    
      player.play()
      player.volume = 0.35
      layer.addSublayer(playLayer)

    }

    required init?(coder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
      super.layoutSubviews()
        playLayer.frame = CGRect(x: 0,
                                 y: 0,
                                 width: UIScreen.main.bounds.width,
                                 height: UIScreen.main.bounds.height)
    }
}
