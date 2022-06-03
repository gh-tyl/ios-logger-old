import Foundation
import SwiftUI
import Combine
import CoreData
import CoreMotion

class AtmosphericPressureManager: NSObject, ObservableObject {
    let willChange = PassthroughSubject<Void, Never>()

    var altimeter:CMAltimeter?

    @Published var pressureString:String = ""
    @Published var absaltitudeString:String = ""
    @Published var relaltitudeString:String = ""

    override init() {
        super.init()
        altimeter = CMAltimeter()
//        startRelativeAltitudeUpdates()
//        startAbsoluteAltitudeUpdate()
    }

//    気圧
    func startRelativeAltitudeUpdates() {
        if(CMAltimeter.isRelativeAltitudeAvailable()) {
            altimeter!.startRelativeAltitudeUpdates(to: OperationQueue.main, withHandler:
                {data, error in
                    if error == nil {
                        let pressure:Double = data!.pressure.doubleValue
                        self.pressureString = String(pressure)
                        self.willChange.send()
                    }
            })
        }
    }
    
    func resetRelativeAltitudeUpdate(){
        altimeter?.stopRelativeAltitudeUpdates()
        startRelativeAltitudeUpdates()
    }
    
//    高度
    func startAbsoluteAltitudeUpdate() {
        if(CMAltimeter.isAbsoluteAltitudeAvailable()) {
            altimeter!.startAbsoluteAltitudeUpdates(to: OperationQueue.main, withHandler:
                {data, error in
                    if error == nil {
                        let absaltitude:Double = data!.altitude
                        self.absaltitudeString = String(absaltitude)
                        self.willChange.send()
                    }
            })
        }
    }
    func resetAbsoluteAltitudeUpdate(){
        altimeter?.stopAbsoluteAltitudeUpdates()
        startAbsoluteAltitudeUpdate()
    }
}
