import SwiftUI

struct SensorListView: View {
    @State var sensorItem: String = ""
    
    var body: some View {
        VStack {
            ForEach(0..<15) { _ in
                SensorRowView(sensorItem: sensorItem)
            }
        }
    }
}

struct SensorListView_Previews: PreviewProvider {
    static var previews: some View {
        SensorListView(sensorItem: "Hello World!")
            .previewLayout(.sizeThatFits)
    }
}
