import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @State var titleSensorLogs: String = "Sensor Logs"
    
    var body: some View{
        TabView {
            SensorLogsView(title: titleSensorLogs).tabItem{
                Text("Logs")
                Image(systemName: "doc")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(titleSensorLogs: "Sensor Logs")
            .environmentObject(SensorItemModelData())
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
