import SwiftUI

struct NavigationButtonView<Content: View>: View {
    @EnvironmentObject var envData: EnvironmentData
    @State var isActive: Bool = true
    var content: Content
    var imgName: String = "record.circle"
    var imgColor: Color = .yellow
    var imgSize: CGFloat = 50.0
    
    var body: some View {
        VStack {
            NavigationLink("NavigationLink", destination: content, isActive: $isActive)
            Button(action: {
                print("isActive: \(isActive)")
                envData.isNavigationActive = $isActive
            }, label: {
                Image(systemName: imgName)
                    .foregroundColor(imgColor)
                    .font(.system(size: imgSize))
            })
        }
        
        
//        NavigationLink(destination: content) {
//            Button(action: {
//                print("isActive: \(isActive)")
//                envData.isNavigationActive = $isActive
//            }, label: {
//                Image(systemName: imgName)
//                    .foregroundColor(imgColor)
//                    .font(.system(size: imgSize))
//            })
//        }
    }
}

struct NavigationButtonView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationButtonView(isActive: true, content: ReadyView())
            .previewLayout(.sizeThatFits)
    }
}
