import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @State var titleSensorLogs: String = ""
    @State var SensorItemModels: [SensorItemModel] = SensorItemsList
    
    var body: some View{
        TabView {
            SensorLogsView(title: titleSensorLogs, SensorItemModels: SensorItemModels).tabItem{
                Text("Logs")
                Image(systemName: "doc")
            }
//            DataView().tabItem{
//                Text("Data")
//                Image(systemName: "waveform")
//            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(titleSensorLogs: "Sensor Logs", SensorItemModels: SensorItemsList).environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
