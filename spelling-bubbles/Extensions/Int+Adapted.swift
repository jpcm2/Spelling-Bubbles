//
//  Int+Adapted.swift
//  joaninos
//
//  Created by alexdamascena on 18/10/22.
//

import UIKit

enum Device {
    
    case iphone11
    
    static let baseScreenSize: Device = .iphone11
    
    var rawValue: CGSize {
        switch self {
        case .iphone11:
            return CGSize(width: 375, height: 812)
        }
    }
}

enum Size {
    case width
    case height
}

extension Int {
    
    private func adapted(dimensionSize: CGFloat, to dimension: Size) -> CGFloat {
        let screenWidth = UIScreen.main.bounds.size.width
        let screenHeight = UIScreen.main.bounds.size.height
        
        var ratio: CGFloat = 0
        var resultDimensionSise: CGFloat = 0.0
        
        switch dimension {
        case .width:
            ratio = dimensionSize / Device.baseScreenSize.rawValue.width
            resultDimensionSise = screenWidth * ratio
        case .height:
            ratio = dimensionSize / Device.baseScreenSize.rawValue.height
            resultDimensionSise = screenHeight * ratio
        }
        
        return resultDimensionSise
    }
    
    var VAdapted: CGFloat {
        adapted(dimensionSize: CGFloat(self), to: .height)
    }
    
    var HAdapted: CGFloat {
        adapted(dimensionSize: CGFloat(self), to: .width)
    }
}

