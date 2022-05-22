import SwiftUI

struct BackgroundView: View {
    @State var title: String = ""
    @State var sensorItem: String = ""
    
    var body: some View {
        ZStack {
            VStack{
                ScrollView {
                    TitleView(title: title)
                    SensorListView(sensorItem: sensorItem)
                }
                .frame(maxHeight: .infinity, alignment: .top)
            }
            RecordView()
        }
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView(title: "title", sensorItem: "Hello World!")
    }
}
