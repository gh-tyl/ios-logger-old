import SwiftUI

struct PickerSetView: View {
    var title: String = ""
    var height: CGFloat = 1.0
    var bar_color: Color = .gray
    
    var body: some View {
        VStack {
            TitleView(title: title, height: height, bar_color: bar_color)
            PickerView()
        }
    }
}

struct PickerSetView_Previews: PreviewProvider {
    static var previews: some View {
        PickerSetView(
            title: "Activity", height: 1.0, bar_color: .gray
        ).previewLayout(.sizeThatFits)
    }
}
