import SwiftUI

struct SensorLogsView: View {
    
    var body: some View {
        NavigationView {
            SensorTemplateView()
        }
    }
}

struct SensorLogsView_Previews: PreviewProvider {
    static var previews: some View {
        SensorLogsView()
            .environmentObject(SensorItemModelData())
    }
}
