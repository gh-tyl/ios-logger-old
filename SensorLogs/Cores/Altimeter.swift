import Foundation
import SwiftUI
import Combine
import CoreData
import CoreMotion

class AltimeterManager: NSObject, ObservableObject {
    let willChange = PassthroughSubject<Void, Never>()

    var altimeter:CMAltimeter?

    @Published var absaltitudeString: String = "" // 絶対高度
    @Published var relaltitudeString: String = "" // 相対高度
    @Published var pressureString: String = "" // 気圧

    override init() {
        super.init()
        altimeter = CMAltimeter()
    }
    
//    絶対高度
    func startAbsoluteAltitudeUpdate() {
        if(CMAltimeter.isAbsoluteAltitudeAvailable()) {
            altimeter!.startAbsoluteAltitudeUpdates(to: OperationQueue.main, withHandler:{
                data, error in
                if error == nil {
                    let absaltitude: Double = data!.altitude
                    self.absaltitudeString = String(absaltitude)
                    self.willChange.send()
                }
            })
        } else {
            print("AbsoluteAltitude is unavailable")
        }
    }
    func stopAbsoluteAltitudeUpdate(){
        altimeter?.stopAbsoluteAltitudeUpdates()
    }
//    相対高度
    func startRelativeAltitudeUpdate() {
        if(CMAltimeter.isRelativeAltitudeAvailable()) {
            altimeter!.startRelativeAltitudeUpdates(to: OperationQueue.main, withHandler: {
                data, error in
                if error == nil {
                    let relaltitude: NSNumber = data!.relativeAltitude
                    self.relaltitudeString = String(relaltitude.floatValue)
                    self.willChange.send()
                }
            })
        } else {
            print("RelativeAltitude is unavailable")
        }
    }
    func stopRelativeAltitudeUpdate(){
        altimeter?.stopRelativeAltitudeUpdates()
    }
    
//    気圧
    func startAtomosphericPressureUpdate() {
        if(CMAltimeter.isRelativeAltitudeAvailable()) {
            altimeter!.startRelativeAltitudeUpdates(to: OperationQueue.main, withHandler: {
                data, error in
                if error == nil {
                    let pressure: NSNumber = data!.pressure
                    self.pressureString = String(pressure.floatValue)
                    self.willChange.send()
                }
            })
        }
    }
    func stopAtomosphericPressureUpdate() {
        altimeter?.stopRelativeAltitudeUpdates()
    }
}
