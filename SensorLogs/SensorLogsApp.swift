//
//  SensorLogsApp.swift
//  SensorLogs
//
//  Created by Tyler Inari on 2022/01/06.
//

import SwiftUI

@main
struct SensorLogsApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
