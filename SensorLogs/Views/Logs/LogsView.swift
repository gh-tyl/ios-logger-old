import SwiftUI
import Combine
import CoreData
import CoreMotion

struct LogsView: View {
    @ObservedObject var apmanager = AtmosphericPressureManager()
    @ObservedObject var sbmanager = ScreenBrightnessManager()
    
    @State var recordflag: Bool = true
    @State var timer :Timer?
    @State var currentdatetime = GetCurrentDatetime()
    
    let relavailabe = CMAltimeter.isRelativeAltitudeAvailable()
    let absavailabe = CMAltimeter.isAbsoluteAltitudeAvailable()
    
    @State var dir = File.documentDirectory.filePaths
    let logswriter = LogsWriter()

    var body: some View {
        VStack(spacing: 30) {
            VStack(spacing: 30) {
                HStack{
                    Text("日時: ")
                    Text(currentdatetime)
                }
                HStack {
                    Text("気圧: ")
                    Text(relavailabe ? apmanager.pressureString : "----")
                }
                HStack {
                    Text("高度: ")
                    Text(absavailabe ? apmanager.absaltitudeString : "----")
                }
                HStack {
                    Text("輝度: ")
                    Text(sbmanager.brightnessString != "" ? sbmanager.brightnessString : "----")
                }
            }
            if recordflag {
                Button(action: {
                    recordflag = false
                    let path:URL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("\(GetCurrentDatetimeFilename())_SensorLogs.csv")
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
                    self.timer?.invalidate()
                    let logs:[String: String] = [
                        "datetime": "\(currentdatetime)",
                        "atmospheric_pressure": "\(apmanager.pressureString)",
                        "abs_altitude": "\(apmanager.absaltitudeString)",
                        "screen_brightness": "\(sbmanager.brightnessString)"
                    ]
                    print("logswriter.write")
                    self.logswriter.write(logs)
                    print("logswriter.close")
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
