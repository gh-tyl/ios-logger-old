//
//  SensorLogsView.swift
//  SensorLogs
//
//  Created by Tyler Inari on 2022/05/20.
//

import SwiftUI

struct SensorLogsView: View {
    @State var title: String = ""
    @State var sensorItem: String = ""
    
    var body: some View {
        BackgroundView(title: title, sensorItem: sensorItem)
    }
}

struct SensorLogsView_Previews: PreviewProvider {
    static var previews: some View {
        SensorLogsView(title: "title", sensorItem: "Hello World")
    }
}
