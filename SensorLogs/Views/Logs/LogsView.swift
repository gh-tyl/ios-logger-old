//
//  LogsView.swift
//  SensorLogs
//
//  Created by Tyler Inari on 2022/02/06.
//

import SwiftUI
import Combine
import CoreData
import CoreMotion

struct LogsView: View {
    @ObservedObject var manager = AltimatorManager()

    let availabe = CMAltimeter.isRelativeAltitudeAvailable()

    var body: some View {
        VStack(spacing: 30) {
            VStack(spacing: 30) {
                Text(availabe ? manager.pressureString : "----")
                Text(availabe ? manager.altitudeString : "----")
            }
            Button(action: {
                self.manager.doReset()
            }) {
                Text("リセット")
            }
        }
    }
}

struct LogsView_Previews: PreviewProvider {
    static var previews: some View {
        LogsView()
    }
}
