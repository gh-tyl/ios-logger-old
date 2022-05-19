//
//  BackgroundView.swift
//  SensorLogs
//
//  Created by Tyler Inari on 2022/05/20.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        VStack{
            TitleView()
            SensorListView()
        }
        .frame(maxHeight: .infinity, alignment: .top)
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
    }
}
