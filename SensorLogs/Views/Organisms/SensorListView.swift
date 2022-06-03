import SwiftUI

struct SensorListView: View {
    @State var sensorItemModels: [SensorItemModel] = SensorItemsList
    
    var body: some View {
        VStack {
            List(sensorItemModels, id: \.id) { sensorItemModel in
                SensorRowView(sensorItem: sensorItemModel)
            }
//            ForEach(sensorItemModels, id: \.id) { item in
//                SensorRowView(sensorItem: item, sensorItemName: item.itemNameEN)
//            }
        }
    }
}

struct SensorListView_Previews: PreviewProvider {
    static var previews: some View {
        SensorListView(sensorItemModels: SensorItemsList)
            .previewLayout(.sizeThatFits)
    }
}
