import SwiftUI

struct SensorListView: View {
    @EnvironmentObject var sensorItemModelData: SensorItemModelData
    
    var body: some View {
        VStack {
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
