import SwiftUI

struct SensorRowView: View {
    @State var sensorItem: String = ""
    
    var body: some View {
        HStack {
            SensorItemView(sensorItem: sensorItem)
            ToggleView()
        }.frame(maxWidth: .infinity)
    }
}

struct SensorRowView_Previews: PreviewProvider {
    static var previews: some View {
        SensorRowView(sensorItem: "Hello World!")
            .previewLayout(.sizeThatFits)
    }
}
