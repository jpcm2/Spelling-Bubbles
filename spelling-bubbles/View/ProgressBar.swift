//
//  ProgressBar.swift
//  spelling-bubbles
//
//  Created by alexdamascena on 20/10/22.
//

import SpriteKit

class ProgressBar: SKNode, AnyNode {
    
    
    private var progress: CGFloat = 0
    private var maxProgress: CGFloat?
    
    private let progressTexture = SKTexture(imageNamed: Constants.PROGRESS_BAR_TEXTURE)
    
    private let progressContainerTexture = SKTexture(imageNamed: Constants.PROGRESS_BAR_CONTAINER)
    
    private var progressBar: SKSpriteNode?
    private var progressBarContainer: SKSpriteNode?
    

    struct Constants {
        static let PROGRESS_BAR_TEXTURE = "progress-bar-content"
        static let PROGRESS_BAR_CONTAINER = "progress-bar-container"
        static let PROGRESS_BAR_CONTAINER_SIZE = CGSize(width: 249.HAdapted,
                                                        height: 31.VAdapted)
        static let PROGRESS_BAR_SIZE = CGSize(width: 0.HAdapted,
                                             height: 24.VAdapted)
    }
    
    private var midProgressBar: CGFloat {
        return Constants.PROGRESS_BAR_CONTAINER_SIZE.width / 2 - 6
    }
    
    init(withMaxProgress progress: CGFloat) {
        super.init()
        self.maxProgress = progress
        setupNode()
        build()
    }
    
    func setupPosition() {
        let screenHeight = CGFloat(UIScreen.main.bounds.height)
        
        self.zPosition = 10
        self.position = CGPoint(x: midProgressBar + 16.HAdapted, y: screenHeight - 70.VAdapted)
    }

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func build(){
        progressBarContainer = SKSpriteNode(texture: progressContainerTexture, size: progressContainerTexture.size())
        progressBarContainer?.size = Constants.PROGRESS_BAR_CONTAINER_SIZE
        
        progressBar = SKSpriteNode(texture: progressTexture, size: progressTexture.size())
        progressBar?.size = Constants.PROGRESS_BAR_SIZE
        progressBar?.position.x = -midProgressBar
        progressBar?.anchorPoint.x = 0
        
        guard let progressBar = progressBar,
              let progressBarContainer = progressBarContainer else { return }
        
        addChild(progressBarContainer)
        addChild(progressBar)
    }
    
    func update(){
        guard let maxProgress = maxProgress else { return }
        if progress > maxProgress { return }
        
        let width: CGFloat = (progress / maxProgress) * (2 * midProgressBar)
        progressBar?.run(SKAction.resize(toWidth: width, duration: 0.2))
        
        progress += 1
    }
}
