//
//  SensorListView.swift
//  SensorLogs
//
//  Created by Tyler Inari on 2022/05/19.
//

import SwiftUI

struct SensorListView: View {
    var body: some View {
        VStack {
            ForEach(0..<5) { _ in
                SensorRowView()
            }
            Button(action: {print("start record")},
                   label: {
                Image(systemName: "record.circle")
                    .foregroundColor(.black)
                    .font(.system(size: 50))
            }
            )
        }
    }
}

struct SensorListView_Previews: PreviewProvider {
    static var previews: some View {
        SensorListView()
            .previewLayout(.sizeThatFits)
    }
}
