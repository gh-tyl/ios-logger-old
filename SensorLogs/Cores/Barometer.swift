import Foundation
import SwiftUI
import Combine
import CoreData
import CoreMotion

class AtmosphericPressureManager: NSObject, ObservableObject {
    let willChange = PassthroughSubject<Void, Never>()

    var altimeter:CMAltimeter?

    @Published var pressureString:String = ""
    @Published var relaltitudeString:String = ""
    @Published var absaltitudeString:String = ""

    override init() {
        super.init()
        altimeter = CMAltimeter()
        startUpdate()
    }

    func doReset(){
        altimeter?.stopRelativeAltitudeUpdates()
        altimeter?.stopAbsoluteAltitudeUpdates()
        startUpdate()
    }

    func startUpdate() {
        if(CMAltimeter.isRelativeAltitudeAvailable()) {
            altimeter!.startRelativeAltitudeUpdates(to: OperationQueue.main, withHandler:
                {data, error in
                    if error == nil {
                        let pressure:Double = data!.pressure.doubleValue
//                        self.pressureString = String(format: "気圧:%.1f hPa", pressure * 10)
                        self.pressureString = String(pressure)
                        self.willChange.send()
                    }
            })
        }
        if(CMAltimeter.isAbsoluteAltitudeAvailable()) {
            altimeter!.startAbsoluteAltitudeUpdates(to: OperationQueue.main, withHandler:
                {data, error in
                    if error == nil {
                        let absaltitude:Double = data!.altitude
//                        self.absaltitudeString = String(format: "高さ:%.2f m", absaltitude)
                        self.absaltitudeString = String(absaltitude)
                        self.willChange.send()
                    }
            })
        }
    }
}
