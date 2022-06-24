import SwiftUI

struct SensorTemplateView: View {
    @State var title: String = "Sensor Logs"
    var height: CGFloat = 2.0
    var bar_color: Color = .gray
    
    var body: some View {
        VStack{
            ScrollView {
                TitleView(
                    title: title, height: height, bar_color: bar_color
                )
                SensorListView()
            }
            .frame(maxHeight: .infinity, alignment: .top)
            Spacer()
            NavigationButtonView(
                content: ReadyView(), imgName: "play"
            )
            Spacer()
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct SensorTemplateView_Previews: PreviewProvider {
    static var previews: some View {
        SensorTemplateView(title: "Sensor Logs")
            .environmentObject(SensorItemModelData())
    }
}
