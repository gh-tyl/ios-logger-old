//
//  ContentView.swift
//  SensorLogs
//
//  Created by Tyler Inari on 2022/01/06.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    var body: some View{
        TabView {
            LogsView().tabItem{
                Text("Logs")
                Image(systemName: "command")
            }
            DataView().tabItem{
                Text("Data")
                Image(systemName: "shift")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
