import SwiftUI

struct SensorTemplateView: View {
    var isActive: Bool = false
    var title: String = "Sensor Logs"
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
//            NavigationButtonView(
//                isActive: isActive, content: ReadyView()
//            )
            NavigationButtonView(
                content: ReadyView()
            )
            Spacer()
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct SensorTemplateView_Previews: PreviewProvider {
    static var previews: some View {
        SensorTemplateView()
            .environmentObject(SensorItemModelData())
    }
}
