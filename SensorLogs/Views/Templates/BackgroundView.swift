import SwiftUI

struct BackgroundView: View {
    @State var title: String = ""
    
    var body: some View {
        ZStack {
            VStack{
                ScrollView {
                    TitleView(title: title)
                    SensorListView()
                }
                .frame(maxHeight: .infinity, alignment: .top)
            }
            RecordView()
        }
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView(title: "Background")
            .environmentObject(SensorItemModelData())
    }
}
