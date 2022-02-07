import SwiftUI

struct DataView: View {
    @ObservedObject var manager = ScreenBrightnessManager()

    var currentBrightness = UIScreen.main.brightness
    
    var body: some View {
        VStack(spacing: 30) {
            VStack(spacing: 30) {
                Text(manager.brightnessString)
            }
            Button(action: {
                self.manager.doReset()
            }) {
                Text("リセット")
            }
        }
    }
}

struct DataView_Previews: PreviewProvider {
    static var previews: some View {
        DataView()
    }
}
