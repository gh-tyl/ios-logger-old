import SwiftUI

class EnvironmentData: ObservableObject {
    @Published var isNavigationActive: Binding<Bool> = Binding<Bool>.constant(false)
}

struct SensorLogsView: View {
    @EnvironmentObject var envData: EnvironmentData
    @State var isActive: Bool = true
    
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
