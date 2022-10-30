//
//  GameViewController.swift
//  spelling-bubbles
//
//  Created by alexdamascena on 18/10/22.
//

import UIKit
import SwiftUI
import SpriteKit

typealias Game = GameScene & ShakeHandler

class GameViewController: UIViewController {
        
    var scene: GameScene?
    var viewManager: ViewManager?
    var levelManager: LevelManager?
    
    init(viewManager: ViewManager, levelManager: LevelManager){
        super.init(nibName: nil, bundle: nil)
        self.viewManager = viewManager
        self.levelManager = levelManager
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
        guard let level = levelManager?.userLevel() else { return }
        
        let newScene = GameScene(withLevel: level, andSize: view.bounds.size)
        view.presentScene(newScene)
        self.scene = newScene
        self.scene?.controllerPauseDelegate = self
    }
    
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            guard let skview = view as? SKView, let scene = skview.scene as? Game else { return }
            scene.didUserStartShake()
        }
    }
}

extension GameViewController: PauseButtonDelegate {
    
    func pauseButtonPressed() {
        
        let vc = UIHostingController(rootView: PauseMenuView(actionXButton: {
            self.scene?.isGamePaused = false
            self.dismiss(animated: true, completion: nil)
        }, actionMenuPressed: {
            self.viewManager?.didUserTapGoToMenu()
            self.levelManager?.levelCompleted()
            self.dismiss(animated: true, completion: nil)
        }))
        
        vc.modalPresentationStyle = .overFullScreen
        vc.view.backgroundColor = .clear
        self.present(vc, animated: true)
    }
}
