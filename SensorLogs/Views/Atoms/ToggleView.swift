//
//  ToggleView.swift
//  SensorLogs
//
//  Created by Tyler Inari on 2022/05/19.
//

import SwiftUI

struct ToggleView: View {
    @State private var isSet = false
//    var padding_size: CGFloat = 10
    
    var body: some View {
        Toggle(isOn: $isSet) {
        }.labelsHidden().padding()
//            .padding(padding_size)
    }
}

struct ToggleView_Previews: PreviewProvider {
    static var previews: some View {
        ToggleView().previewLayout(.sizeThatFits)
    }
}
