//
//  GameViewController.swift
//  spelling-bubbles
//
//  Created by alexdamascena on 18/10/22.
//

import UIKit
import SwiftUI
import SpriteKit
import CoreMotion

typealias Game = GameScene & ShakeHandler

class GameViewController: UIViewController {
    
    var scene: GameScene?
    var viewManager: ViewManager?
    var levelManager: LevelManager?
    var motion = CMMotionManager()
    
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
//        startMotionDetector()
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
        self.scene?.controllerGameSceneDelegate = self
    }
    
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            guard let skview = view as? SKView, let scene = skview.scene as? Game else { return }
            scene.didUserStartShake()
        }
    }
    
    private func startMotionDetector(){
//        motion.gyroUpdateInterval = 0.5
//        guard let operation = OperationQueue.current else { return }
//        motion.startGyroUpdates(to: operation){ (data, error) in
//            guard let datinha = data else { return }
//            let x = datinha.rotationRate.x
//            let y = datinha.rotationRate.y
//            let z = datinha.rotationRate.z
//            if x < 0 {
//                self.scene?.didUserStartShake()
//            }
//            print("x: \(Double(x).rounded(toPlaces: 3))")
//            print("y: \(Double(y).rounded(toPlaces: 3))")
//            print("z: \(Double(z).rounded(toPlaces: 3))")
//        }
    }
}

extension Double {
    func rounded(toPlaces places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
        
    }
}
