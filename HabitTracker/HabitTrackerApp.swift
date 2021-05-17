//
//  HabitTrackerApp.swift
//  HabitTracker
//
//  Created by Antonio Vega on 5/6/21.
//

import SwiftUI

@main
struct HabitTrackerApp: App {
    let persistenceController = PersistanceController.shared
//    @Environment(\.scenePhase) var scenePhase
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
//        .onChange(of: scenePhase) { _ in
//            persistenceController.save()
//        }
    }
}
