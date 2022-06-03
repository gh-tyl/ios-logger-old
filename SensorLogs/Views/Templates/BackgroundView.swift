import SwiftUI

struct BackgroundView: View {
    @State var title: String = ""
    @State var SensorItemModels: [SensorItemModel] = SensorItemsList
    
    var body: some View {
        ZStack {
            VStack{
                ScrollView {
                    TitleView(title: title)
                    SensorListView(sensorItemModels: SensorItemModels)
                }
                .frame(maxHeight: .infinity, alignment: .top)
            }
            RecordView()
        }
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView(title: "Background", SensorItemModels: SensorItemsList)
    }
}
