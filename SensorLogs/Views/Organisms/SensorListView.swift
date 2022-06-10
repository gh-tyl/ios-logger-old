import SwiftUI

struct SensorListView: View {
    @EnvironmentObject var sensorItemModelData: SensorItemModelData
//    @State var sensorItemModels: [SensorItemModel]
    
    var body: some View {
        VStack {
//            List(sensorItemModelData.SensorItems, id: \.id) { item in
//                SensorRowView(sensorItemModel: item)
//            }
            ForEach(sensorItemModelData.SensorItems, id: \.id) { item in
                SensorRowView(sensorItemModel: item)
            }
        }
    }
}

struct SensorListView_Previews: PreviewProvider {
    static var previews: some View {
        SensorListView()
            .environmentObject(SensorItemModelData())
            .previewLayout(.sizeThatFits)
    }
}
