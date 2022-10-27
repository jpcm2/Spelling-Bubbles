//
//  LevelPage.swift
//  spelling-bubbles
//
//  Created by alexdamascena on 27/10/22.
//

import Foundation
import SwiftUI

struct LevelPosition: Hashable, Identifiable {
    var id: ObjectIdentifier?
    
    let x: Double
    let y: Double
}

struct LevelPage : View {
    
    struct Constants {
        static let BACKGROUND = "level-map"
    }
    
    let paddings = EdgeInsets(top: 47.VAdapted,
                              leading: 14.HAdapted,
                              bottom: 0,
                              trailing: 14.HAdapted)
    
    var positions: [LevelPosition] = {
        
        let firstLevel = LevelPosition(x: 250.HAdapted, y: 200.VAdapted)
        let secondLevel = LevelPosition(x: 320.HAdapted, y: 270.VAdapted)
        let thirdLevel = LevelPosition(x: 290.HAdapted, y: 400.VAdapted)
        let fourthLevel = LevelPosition(x: 230.HAdapted, y: 600.VAdapted)
        let fifthLevel = LevelPosition(x: 60.HAdapted, y: 720.VAdapted)
        
        return [firstLevel, secondLevel, thirdLevel, fourthLevel, fifthLevel ]
    }()
    
    var body: some View {
        ZStack{
            Image(Constants.BACKGROUND)
                .resizable()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                .edgesIgnoringSafeArea([.trailing, .leading, .bottom])
            
            VStack {
                TopButtonsStackView()
                    .padding(paddings)
                Spacer()
            }
            
            ForEach(0..<positions.count, id: \.self) { index in
                LevelButton(position: positions[index],
                            didUserTap: {
                    print("10")
                }, title: "\(index+1)")
            }
        }
    }
}


struct LevelPage_Previews : PreviewProvider {
    static var previews: some View {
        LevelPage()
    }
}
