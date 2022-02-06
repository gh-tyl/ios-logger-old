//
//  DataView.swift
//  SensorLogs
//
//  Created by Tyler Inari on 2022/02/06.
//

import SwiftUI

struct DataView: View {
    var currentBrightness: CGFloat = 0.0
    
    func getCurrentBrightness() {
      currentBrightness = UIScreen.main.brightness
    }

    var body: some View {
        VStack(spacing: 30) {
            VStack(spacing: 30) {
                Text(availabe ? manager.pressureString : "----")
                Text(availabe ? manager.altitudeString : "----")
            }
        }
//        Button(action: {
//            self.manager.doReset()
//        }) {
//            Text("リセット")
//        }
//        Text("\(currentBrightness)")
//        Button("Get Current Brightness", action: getCurrentBrightness)
    }
}

struct DataView_Previews: PreviewProvider {
    static var previews: some View {
        DataView()
    }
}
