//
//  ProgressBar.swift
//  spelling-bubbles
//
//  Created by alexdamascena on 20/10/22.
//

import SpriteKit

class ProgressBar: SKNode {
    
    
    private var progress: CGFloat = 0
    private var maxProgress: CGFloat?
    
    private var sceneFrame = CGRect()
    
    private let progressTexture = SKTexture(imageNamed: Constants.PROGRESS_BAR_TEXTURE)
    
    private let progressContainerTexture = SKTexture(imageNamed: Constants.PROGRESS_BAR_CONTAINER)
    
    private var progressBar: SKSpriteNode?
    private var progressBarContainer: SKSpriteNode?
    

    struct Constants {
        static let PROGRESS_BAR_TEXTURE = "progress-bar-content"
        static let PROGRESS_BAR_CONTAINER = "progress-bar-container"
    }
    
    
    init(withMaxProgress progress: CGFloat, andFrame frame: CGRect) {
        super.init()
        self.maxProgress = progress
        self.sceneFrame = frame
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func build(){
        progressBarContainer = SKSpriteNode(texture: progressContainerTexture, size: progressContainerTexture.size())
        progressBarContainer?.size = CGSize(width: sceneFrame.width * 0.7,
                                            height: sceneFrame.height * 0.1)
        
        progressBar = SKSpriteNode(texture: progressTexture, size: progressTexture.size())
        progressBar?.size = CGSize(width: sceneFrame.width * 0.2, height: sceneFrame.width * 0.08)
        
        guard let progressBar = progressBar,
              let progressBarContainer = progressBarContainer else { return }
        
        addChild(progressBar)
        addChild(progressBarContainer)
    }
    
}
