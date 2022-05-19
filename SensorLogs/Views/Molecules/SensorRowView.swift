//
//  SensorItemView.swift
//  SensorLogs
//
//  Created by Tyler Inari on 2022/05/19.
//

import SwiftUI

struct SensorRowView: View {
    @State var screen: CGSize!
    
    var body: some View {
        HStack {
            SensorItemView()
            ToggleView()
        }.frame(maxWidth: .infinity)
    }
}

struct SensorRowView_Previews: PreviewProvider {
    static var previews: some View {
        SensorItemView()
            .previewLayout(.sizeThatFits)
    }
}
