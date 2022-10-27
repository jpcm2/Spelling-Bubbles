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
    
    let paddings = EdgeInsets(top: 32,
                              leading: 14.HAdapted,
                              bottom: 0,
                              trailing: 14.HAdapted)
    
    var positions: [LevelPosition] = {
        let width = UIScreen.main.bounds.width
        let height = UIScreen.main.bounds.height
        
        let firstLevel = LevelPosition(x: 250.HAdapted, y: 200.VAdapted)
        let secondLevel = LevelPosition(x: 320.HAdapted, y: 270.VAdapted)
        let thirdLevel = LevelPosition(x: width * 0.64, y: height * 0.55)
        let fourthLevel = LevelPosition(x: width * 0.5, y: height * 0.7)
        let fifthLevel = LevelPosition(x: width * 0.15, y: height * 0.9)
        
        return [firstLevel, secondLevel, thirdLevel, fourthLevel, fifthLevel ]
    }()
    
    var body: some View {
        ZStack{
            Image(Constants.BACKGROUND)
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
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
