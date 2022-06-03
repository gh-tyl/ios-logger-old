import SwiftUI

struct SensorItemView: View {
    @State var sensorItemName: String = ""
    
    var body: some View {
        Text(sensorItemName)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
    }
}

struct SensorItemView_Previews: PreviewProvider {
    static var previews: some View {
        SensorItemView(sensorItemName: "Hello World!").previewLayout(.sizeThatFits)
    }
}
