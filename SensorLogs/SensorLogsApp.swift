//
//  SensorLogsApp.swift
//  SensorLogs
//
//  Created by Tyler Inari on 2022/01/06.
//

import SwiftUI

@main
struct SensorLogsApp: App {
    @StateObject private var sensorItemModelData = SensorItemModelData()
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(sensorItemModelData)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
