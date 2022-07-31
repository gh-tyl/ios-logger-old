import SwiftUI

struct RecordingView: View {
    var isNavigationBarBackButtonHidden: Bool = false
    var isActive: Bool = false
    var body: some View {
        VStack {
            NavigationButtonView(isActive: isActive, content: SensorLogsView())
        }
        .navigationBarBackButtonHidden(isNavigationBarBackButtonHidden)
    }
}

struct RecordingView_Previews: PreviewProvider {
    static var previews: some View {
        RecordingView()
    }
}
