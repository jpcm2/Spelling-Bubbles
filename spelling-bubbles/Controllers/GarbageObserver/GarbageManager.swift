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
    
    private var isLeft = true
    
    struct Constants {
        static let SPACE_TO_OCCUPY = 6
    }
    
    init(){
        createAvaiableSpawnPosition()
        self.right = avaiablePositions.count-1
    }
    
    private func createAvaiableSpawnPosition(){
        for newPosition in 1...Constants.SPACE_TO_OCCUPY {
            let newPoint = CGPoint(x: Int(UIScreen.main.bounds.width) - 9*newPosition*newPosition,
                                   y: 700 - 16*newPosition)
            print(newPoint)
            let newAvaiablePosition = AvaiablePosition(position: newPoint,
                                                       isOccupied: false)
            avaiablePositions.append(newAvaiablePosition)
        }
    }
    
    func getNextAvaiablePosition() -> AvaiablePosition {
        
        var position: AvaiablePosition?
        
        if isLeft {
            avaiablePositions[left].isOccupied = true
            position = avaiablePositions[left]
            self.left += 1
        } else {
            avaiablePositions[right].isOccupied = true
            position = avaiablePositions[right]
            self.right -= 1
        }
        
        isLeft.toggle()
        
        if left == right {
            left = 0
            right = avaiablePositions.count - 1
        }
        
        return position ?? AvaiablePosition(position: CGPoint(x: 250,
                                                              y: 700),
                                            isOccupied: false)
    }
}
