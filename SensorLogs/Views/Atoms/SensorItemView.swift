import SwiftUI

struct SensorItemView: View {
    @State var sensorItemNameEN: String = ""
    
    var body: some View {
        Text(sensorItemNameEN)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
    }
}

struct SensorItemView_Previews: PreviewProvider {
    static var previews: some View {
        SensorItemView(sensorItemNameEN: "Hello World!").previewLayout(.sizeThatFits)
    }
}
