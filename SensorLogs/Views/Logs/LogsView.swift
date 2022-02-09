import SwiftUI
import Combine
import CoreData
import CoreMotion
import GoogleAPIClientForREST

struct LogsView: View {
    @ObservedObject var apmanager = AtmosphericPressureManager()
    @ObservedObject var sbmanager = ScreenBrightnessManager()
    
    @State var currentdatetime = GetCurrentDatetime()
    @State var timer :Timer?
    
    let relavailabe = CMAltimeter.isRelativeAltitudeAvailable()
    let absavailabe = CMAltimeter.isAbsoluteAltitudeAvailable()

    var body: some View {
        VStack(spacing: 30) {
            VStack(spacing: 30) {
                Text(currentdatetime)
                Text(relavailabe ? apmanager.pressureString : "----")
                Text(absavailabe ? apmanager.absaltitudeString : "----")
                Text(sbmanager.brightnessString != "" ? sbmanager.brightnessString : "----")
            }
            Button(action: {
                allReset()
            }) {
                Text("Reset")
            }
            Button(action: {
                timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
                    self.currentdatetime = GetCurrentDatetime()
                    sbmanager.doReset()
                }
            }) {
                Text("Start Recording")
            }
            Button(action: {
                CreateCsv(filename: "sample", fileArrData: [["a", "b", "c"], ["d", "e", "f"]])
            }) {
                Text("Save")
            }
        }
    }
    
    func allReset() {
        self.apmanager.doReset()
        self.sbmanager.doReset()
    }
}

struct LogsView_Previews: PreviewProvider {
    static var previews: some View {
        LogsView()
    }
}
