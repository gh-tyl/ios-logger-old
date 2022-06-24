import SwiftUI

struct NavigationButtonView<Content: View>: View {
    @State private var isSet: Bool = false
    var content: Content
    var isDetailLink: Bool = true
    var imgName: String = "record.circle"
    var imgColor: Color = .yellow
    var imgSize: CGFloat = 50.0
    var record = Record()
    
    var body: some View {
        NavigationLink(destination: content, label: {
            Image(systemName: imgName)
                .foregroundColor(imgColor)
                .font(.system(size: imgSize))
        })
        .isDetailLink(isDetailLink)
    }
}

struct NavigationButtonView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationButtonView(content: ReadyView())
            .previewLayout(.sizeThatFits)
    }
}
