import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @State var titleSensorLogs: String = ""
    @State var sensorItem: String = ""
    
    var body: some View{
        TabView {
            SensorLogsView(title: titleSensorLogs, sensorItem: sensorItem).tabItem{
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
        ContentView(titleSensorLogs: "SensorLogs", sensorItem: "Hello World").environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
