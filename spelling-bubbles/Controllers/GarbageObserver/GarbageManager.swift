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
        static let MAXIMUM_Y = UIScreen.main.bounds.height * 0.78
        static let MAXIMUM_X = UIScreen.main.bounds.width * 0.9
    }
    
    init(){
        createAvaiableSpawnPosition()
        self.right = avaiablePositions.count-1
    }
    
    private func createAvaiableSpawnPosition(){
        
        for newPosition in 1...Constants.SPACE_TO_OCCUPY {
            let yPosition: CGFloat = Constants.MAXIMUM_Y - CGFloat(5*newPosition*newPosition)
            let xPosition: CGFloat = Constants.MAXIMUM_X - CGFloat(6*newPosition*newPosition)
            let newPoint = CGPoint(x: xPosition,
                                   y: yPosition)
            
            let newAvaiablePosition = AvaiablePosition(position: newPoint,
                                                       isOccupied: false)
            avaiablePositions.append(newAvaiablePosition)
        }
    }
    
    func getNextAvaiablePosition() -> AvaiablePosition {
        
        var position: AvaiablePosition?
        resetIndexs()
        
        if isLeft {
            position = avaiablePositions[left]
            self.left += 1
        } else {
            position = avaiablePositions[right]
            self.right -= 1
        }
        
        isLeftAndRightEqual()
        isLeft.toggle()
        
        let point = CGPoint(x: 250, y: 700)
        return position ?? AvaiablePosition(position: point,
                                            isOccupied: false)
    }
    
    private func resetIndexs(){
        if left + 1 == right {
            right = avaiablePositions.count - 1
        }
        
        if right - 1 == left {
            left = 0
        }
    }
    
    private func isLeftAndRightEqual(){
        if left == right {
            left = 0
            right = avaiablePositions.count - 1
        }
    }
}
