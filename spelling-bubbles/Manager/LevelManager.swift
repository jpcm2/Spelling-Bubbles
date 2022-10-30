//
//  LevelManager.swift
//  spelling-bubbles
//
//  Created by alexdamascena on 29/10/22.
//

import Foundation



class LevelManager: ObservableObject {
    
    @Published var allLevels: [Level] = []
    private var current = 0
    
    init(){
        createAllLevels()
    }
    
    private func createAllLevels(){
        let firstLevel = LevelPosition(x: 250.HAdapted, y: 200.VAdapted)
        let secondLevel = LevelPosition(x: 320.HAdapted, y: 270.VAdapted)
        let thirdLevel = LevelPosition(x: 290.HAdapted, y: 400.VAdapted)
        let fourthLevel = LevelPosition(x: 230.HAdapted, y: 600.VAdapted)
        let fifthLevel = LevelPosition(x: 60.HAdapted, y: 720.VAdapted)
        
        let positions = [firstLevel, secondLevel, thirdLevel, fourthLevel, fifthLevel]
        
        var levels = positions.map({ position in
            return Level(position: position, status: .blocked)
        })
        
        levels[current].status = .currrent
        allLevels = levels
    }
    
    func userLevel() -> Int {
        return current + 1
    }
    
    func levelCompleted(){
        allLevels[current].status = .completed
        current += 1
        if current >= allLevels.count { return }
        allLevels[current].status = .currrent
    }
}
