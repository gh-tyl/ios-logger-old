import SwiftUI

struct ToggleView: View {
    @State private var isSet: Bool = false
    @State var sensorItem: SensorItemModel
    
    var body: some View {
        Toggle(isOn: $isSet) {
        }
        .labelsHidden()
        .padding()
    }
}

struct ToggleView_Previews: PreviewProvider {
    static var previews: some View {
        ToggleView(sensorItem: SensorItemsList[0])
            .previewLayout(.sizeThatFits)
    }
}
