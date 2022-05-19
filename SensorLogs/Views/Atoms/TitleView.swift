//
//  TitleView.swift
//  SensorLogs
//
//  Created by Tyler Inari on 2022/05/20.
//

import SwiftUI

struct TitleView: View {
    var body: some View {
        let height: CGFloat = 2.0
        let bar_color: Color = .gray
        
        VStack {
            Text("Title")
                .font(.title)
                .fontWeight(.medium)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
            Rectangle()
                .fill(bar_color)
                .frame(height: height)
                .padding(.horizontal)
        }
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView().previewLayout(.sizeThatFits)
    }
}
