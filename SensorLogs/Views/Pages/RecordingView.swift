import SwiftUI

struct RecordingView: View {
    var body: some View {
        VStack {
            NavigationButtonView(content: SensorLogsView())
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct RecordingView_Previews: PreviewProvider {
    static var previews: some View {
        RecordingView()
    }
}
