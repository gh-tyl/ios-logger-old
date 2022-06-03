import SwiftUI

struct SensorLogsView: View {
    @State var title: String = ""
    @State var SensorItemModels: [SensorItemModel] = SensorItemsList
    
    var body: some View {
        BackgroundView(title: title, SensorItemModels: SensorItemModels)
    }
}

struct SensorLogsView_Previews: PreviewProvider {
    static var previews: some View {
        SensorLogsView(title: "Sensor Logs", SensorItemModels: SensorItemsList)
    }
}
