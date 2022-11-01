//
//  GarbageManager.swift
//  spelling-bubbles
//
//  Created by alexdamascena on 20/10/22.
//

import UIKit

class GarbageManager {
    
    private var avaiablePositions: [AvaiablePosition] = []
    private var left = 0
    private var right = 5
        
    struct Constants {
        static let SPACE_TO_OCCUPY = 6
        static let MAXIMUM_Y = UIScreen.main.bounds.height * 0.78
        static let MAXIMUM_X = UIScreen.main.bounds.width * 0.9
    }
    
    init(){
        createAvaiableSpawnPosition()
        self.right = avaiablePositions.count-1
    }
    
    private func createAvaiableSpawnPosition(){
        let firstPosition = CGPoint(x: 80, y: 550)
        let secondPosition = CGPoint(x: 340, y: 650)
        let thirdPosition = CGPoint(x: 250, y: 540)
        let fourthPosition = CGPoint(x: 267, y: 630)
        let fifthPosition = CGPoint(x: 160, y: 600)
        
        let positions = [firstPosition, secondPosition, thirdPosition, fourthPosition, fifthPosition]
        let newAvaiablePosition = positions.map({ position in
            return AvaiablePosition(position: position, isOccupied: false)
        })
        
        avaiablePositions = newAvaiablePosition
    }
    
    func getNextAvaiablePosition() -> AvaiablePosition {
        if left > right {
            left = 0
        }
        let  avaiablePosition = avaiablePositions[left]
        left += 1
        return avaiablePosition
    }

}
