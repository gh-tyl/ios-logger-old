import SwiftUI

public struct UIActivityView: UIViewControllerRepresentable {
    @Binding var fileurls: Set<FileList>
    
    public func makeUIViewController(context: Context) -> UIActivityViewController {
        var activityItems: [Any] = []
        for fileurl in fileurls {
            activityItems.append(URL(fileURLWithPath: fileurl.filepaths))
        }

        let controller = UIActivityViewController(
            activityItems: activityItems,
            applicationActivities: nil)

        return controller
    }

    public func updateUIViewController(_ vc: UIActivityViewController, context: Context) {
    }
}

//struct UIActivityView_Previews: PreviewProvider {
//    static var previews: some View {
//        UIActivityView()
//    }
//}
