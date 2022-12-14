//
//  spelling_bubblesApp.swift
//  spelling-bubbles
//
//  Created by alexdamascena on 18/10/22.
//

import SwiftUI

@main
struct spelling_bubblesApp: App {
    
    let persistenceController = PersistenceController.shared
    let levelManager = LevelManager()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(ViewManager())
                .environmentObject(levelManager)
        }
    }
}
