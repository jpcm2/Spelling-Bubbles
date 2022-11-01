//
//  LevelManager.swift
//  spelling-bubbles
//
//  Created by alexdamascena on 29/10/22.
//

import Foundation



class LevelManager: ObservableObject {
    
    @Published var allLevels: [Level] = []
    
    private var startLevel: Int {
        let value = UserDefaults.standard.value(forKey: Constants.LEVEL)
        guard let value = value, let valueConverted = value as? Int else { return 0 }
        return valueConverted
    }
    
    private var isLevelAlreadySet: Bool {
        return UserDefaults.standard.value(forKey: Constants.LEVEL) != nil
    }
    
    struct Constants {
        static let LEVEL = "level"
        static let START_LEVEL = 0
    }
    
    init(){
        setupUserDefaultToLevel()
        createAllLevels()
    }
    
    func setupUserDefaultToLevel(){
        if isLevelAlreadySet { return }
        UserDefaults.standard.set(Constants.START_LEVEL, forKey: Constants.LEVEL)
    }
    
    private func createAllLevels(){
        let firstLevel = LevelPosition(x: 250.HAdapted, y: 200.VAdapted)
        let secondLevel = LevelPosition(x: 320.HAdapted, y: 270.VAdapted)
        let thirdLevel = LevelPosition(x: 290.HAdapted, y: 400.VAdapted)
        let fourthLevel = LevelPosition(x: 230.HAdapted, y: 600.VAdapted)
        let fifthLevel = LevelPosition(x: 60.HAdapted, y: 720.VAdapted)
        
        let positions = [firstLevel, secondLevel, thirdLevel, fourthLevel, fifthLevel]
        
        var levels = positions.enumerated().map({ (index, position) in
            return Level(position: position, status: index <= startLevel ? .completed : .blocked)
        })
        
        levels[startLevel].status = .currrent
        allLevels = levels
    }
    
    func userLevel() -> Int {
        return startLevel + 1
    }
    
    func levelCompleted(){
        for x in allLevels{
            print(x.status)
        }
        allLevels[startLevel].status = .completed
        let nextLevel = startLevel + 1
        if nextLevel  >= allLevels.count { return }
        UserDefaults.standard.set(nextLevel, forKey: Constants.LEVEL)
        allLevels[nextLevel].status = .currrent
        for x in allLevels{
            print(x.status)
        }
    }
}
