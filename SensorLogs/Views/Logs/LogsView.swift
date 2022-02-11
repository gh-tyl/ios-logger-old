import SwiftUI
import Combine
import CoreData
import CoreMotion
import GoogleAPIClientForREST

struct LogsView: View {
    @ObservedObject var apmanager = AtmosphericPressureManager()
    @ObservedObject var sbmanager = ScreenBrightnessManager()
    
    @State var recordflag: Bool = true
    @State var timer :Timer?
    @State var currentdatetime = GetCurrentDatetime()
    
    var currentdate = GetCurrentDate()
    
    let relavailabe = CMAltimeter.isRelativeAltitudeAvailable()
    let absavailabe = CMAltimeter.isAbsoluteAltitudeAvailable()
    
    var path:URL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("\(GetCurrentDatetimeFilename())_SensorLogs.csv")
    
    let logswriter = LogsWriter()

    var body: some View {
        VStack(spacing: 30) {
            VStack(spacing: 30) {
                Text(currentdatetime)
                Text(relavailabe ? apmanager.pressureString : "気圧:----")
                Text(absavailabe ? apmanager.absaltitudeString : "高度:----")
                Text(sbmanager.brightnessString != "" ? sbmanager.brightnessString : "輝度:----")
            }
            if recordflag {
                Button(action: {
                    recordflag = false
                    print("path is \(path)")
                    print("logswriter.open")
                    self.logswriter.open(path)
                    self.timer = Timer.scheduledTimer(withTimeInterval: 15.0, repeats: true) {_ in
                        let logs:[String: String] = [
                            "datetime": "\(currentdatetime)",
                            "atmospheric_pressure": "\(apmanager.pressureString)",
                            "abs_altitude": "\(apmanager.absaltitudeString)",
                            "screen_brightness": "\(sbmanager.brightnessString)"
                        ]
                        print("logswriter.write")
                        self.logswriter.write(logs)
                    }
                }) {
                    Text("Start Recording")
                }
            } else {
                Button(action: {
                    recordflag = true
                    print("logswriter.close")
                    self.timer?.invalidate()
                    let logs:[String: String] = [
                        "datetime": "\(currentdatetime)",
                        "atmospheric_pressure": "\(apmanager.pressureString)",
                        "abs_altitude": "\(apmanager.absaltitudeString)",
                        "screen_brightness": "\(sbmanager.brightnessString)"
                    ]
                    print("logswriter.write")
                    self.logswriter.write(logs)
                    self.logswriter.close()
                }) {
                    Text("Stop Recording")
                }
            }
            Button(action: {
                allReset()
            }) {
                Text("Reset")
            }
        }.onAppear(perform: {
            timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
                self.currentdatetime = GetCurrentDatetime()
                sbmanager.doReset()
            }
        })
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
