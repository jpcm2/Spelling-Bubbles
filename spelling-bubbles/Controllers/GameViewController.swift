//
//  GameViewController.swift
//  spelling-bubbles
//
//  Created by alexdamascena on 18/10/22.
//

import UIKit
import SpriteKit

typealias Game = GameScene & ShakeHandler

class GameViewController: UIViewController {
    
    var scene: GameScene?
    
    override func loadView() {
        super.loadView()
        self.view = SKView()
        self.view.bounds = UIScreen.main.bounds
    }
    
    override var canBecomeFirstResponder: Bool {
        return true
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        becomeFirstResponder()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupScene()
    }
    
    func setupScene(){
        guard let view = self.view as? SKView, scene == nil else { return }
        let newScene = GameScene(size: view.bounds.size)
        view.presentScene(newScene)
        self.scene = newScene
    }
    
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            guard let skview = view as? SKView, let scene = skview.scene as? Game else { return }
            scene.didUserStartShake()
        }
    }
}
