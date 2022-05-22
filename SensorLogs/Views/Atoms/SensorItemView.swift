import SwiftUI

struct SensorItemView: View {
    @State var sensorItem: String = ""
    var body: some View {
        Text(sensorItem)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
    }
}

struct SensorItemView_Previews: PreviewProvider {
    static var previews: some View {
        SensorItemView(sensorItem: "Hello World!").previewLayout(.sizeThatFits)
    }
}
