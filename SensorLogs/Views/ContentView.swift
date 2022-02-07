import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    var body: some View{
        TabView {
            LogsView().tabItem{
                Text("Logs")
                Image(systemName: "doc")
            }
            DataView().tabItem{
                Text("Data")
                Image(systemName: "waveform")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
