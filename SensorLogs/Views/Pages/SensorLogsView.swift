import SwiftUI

struct SensorLogsView: View {
    @State var title: String = ""
    
    var body: some View {
        BackgroundView(title: title)
    }
}

struct SensorLogsView_Previews: PreviewProvider {
    static var previews: some View {
        SensorLogsView(title: "Sensor Logs")
            .environmentObject(SensorItemModelData())
    }
}
