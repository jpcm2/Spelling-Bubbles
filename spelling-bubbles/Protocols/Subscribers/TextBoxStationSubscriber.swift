//
//  TextBoxStationSubscriber.swift
//  spelling-bubbles
//
//  Created by alexdamascena on 25/10/22.
//

import Foundation


protocol TextBoxStationSubscriber: AddableGame  {
    func checkCurrentWord() -> Bool
}
