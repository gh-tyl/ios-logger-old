//
//  Barometer.swift
//  SensorLogs
//
//  Created by Tyler Inari on 2022/02/05.
//

import Foundation
import SwiftUI
import Combine
import CoreData
import CoreMotion

class AtmosphericPressureManager: NSObject, ObservableObject {
    let willChange = PassthroughSubject<Void, Never>()

    var altimeter:CMAltimeter?

    @Published var pressureString:String = ""
    @Published var altitudeString:String = ""

    override init() {
        super.init()
        altimeter = CMAltimeter()
        startUpdate()
    }

    func doReset(){
        altimeter?.stopRelativeAltitudeUpdates()
        startUpdate()
    }

    func startUpdate() {
        if(CMAltimeter.isRelativeAltitudeAvailable()) {
            altimeter!.startRelativeAltitudeUpdates(to: OperationQueue.main, withHandler:
                {data, error in
                    if error == nil {
                        let pressure:Double = data!.pressure.doubleValue
                        let altitude:Double = data!.relativeAltitude.doubleValue
                        self.pressureString = String(format: "気圧:%.1f hPa", pressure * 10)
                        self.altitudeString = String(format: "高さ:%.2f m",altitude)
                        self.willChange.send()
                    }
            })
        }
    }

}
