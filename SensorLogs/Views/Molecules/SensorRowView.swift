import SwiftUI

struct SensorRowView: View {
    @State var sensorItem: SensorItemModel
    
    var body: some View {
        HStack {
            SensorItemView(sensorItemName: sensorItem.itemNameEN)
            ToggleView(sensorItem: sensorItem)
        }.frame(maxWidth: .infinity)
    }
}

struct SensorRowView_Previews: PreviewProvider {
    static var previews: some View {
        let index: Int = 1
        SensorRowView(sensorItem: SensorItemsList[index])
            .previewLayout(.sizeThatFits)
    }
}
