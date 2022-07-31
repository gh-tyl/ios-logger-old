import SwiftUI

struct ReadyTemplateView: View {
    var isActive: Bool = true
    var title: String = "Ready"
    var height: CGFloat = 2.0
    var bar_color: Color = .gray
    
    var body: some View {
        VStack{
            ScrollView {
                TitleView(
                    title: title, height: height, bar_color: bar_color
                )
                PickersView()
            }
            .frame(maxHeight: .infinity, alignment: .top)
            Spacer()
            NavigationButtonView(isActive: isActive, content: RecordingView())
            Spacer()
        }
    }
}

struct ReadyTemplateView_Previews: PreviewProvider {
    static var previews: some View {
        ReadyTemplateView().previewLayout(.sizeThatFits)
    }
}
