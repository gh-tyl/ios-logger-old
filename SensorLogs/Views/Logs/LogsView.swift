import SwiftUI
import Combine
import CoreData
import CoreMotion

struct LogsView: View {
    @ObservedObject var apmanager = AtmosphericPressureManager()
    @ObservedObject var sbmanager = ScreenBrightnessManager()

    let relavailabe = CMAltimeter.isRelativeAltitudeAvailable()
    let absavailabe = CMAltimeter.isAbsoluteAltitudeAvailable()

    var body: some View {
        VStack(spacing: 30) {
            VStack(spacing: 30) {
                Text(relavailabe ? apmanager.pressureString : "----")
                Text(absavailabe ? apmanager.absaltitudeString : "----")
                Text(sbmanager.brightnessString != "" ? sbmanager.brightnessString : "----")
            }
            Button(action: {
                allReset()
            }) {
                Text("Reset")
            }
        }
    }
    
    func allReset(){
        self.apmanager.doReset()
        self.sbmanager.doReset()
    }
}

struct LogsView_Previews: PreviewProvider {
    static var previews: some View {
        LogsView()
    }
}
