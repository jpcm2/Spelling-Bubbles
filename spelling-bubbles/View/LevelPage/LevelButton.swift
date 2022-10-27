//
//  LevelButton.swift
//  spelling-bubbles
//
//  Created by alexdamascena on 27/10/22.
//

import Foundation
import SwiftUI

struct LevelButton : View {
    
    typealias ButtonPressedAction = (() -> Void)
    
    let position: LevelPosition
    let didUserTap: ButtonPressedAction
    let title: String

    
    struct Constants {
        static let COMPLETED_LEVEL = "level"
        static let TEXT_COLOR = "foreground-text-level"
    }
    
    var body: some View {
        Button(action: {
            didUserTap()
        }, label: {
            ZStack {
                Image(Constants.COMPLETED_LEVEL)
                
                Text(self.title)
                    .fontWeight(.medium)
                    .font(.system(size: 38, design: .rounded))
                    .foregroundColor(Color(Constants.TEXT_COLOR))
            }
        })
        .frame(width: 85, height: 85)
        .position(x: position.x, y: position.y)
    }
}


struct LevelButton_Previews : PreviewProvider {
    static var previews: some View {
        LevelButton(position: LevelPosition(x: 10, y: 10),
                    didUserTap: {
            print("10")
        }, title: "1")
    }
}
