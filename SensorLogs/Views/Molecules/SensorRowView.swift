import SwiftUI

struct SensorRowView: View {
    @State var sensorItemModel: SensorItemModel
    
    var body: some View {
        HStack {
            SensorItemView(sensorItemNameEN: sensorItemModel.itemNameEN)
            SensorToggleViewView(sensorItemModel: sensorItemModel)
        }.frame(maxWidth: .infinity)
    }
}

struct SensorRowView_Previews: PreviewProvider {
    static var previews: some View {
        let index: Int = 0
        SensorRowView(sensorItemModel: SensorItemModelData().SensorItems[index])
            .previewLayout(.sizeThatFits)
    }
}
