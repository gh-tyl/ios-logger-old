import SwiftUI

//struct UIActivityView: View {
//    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//    }
//}

public struct UIActivityView: UIViewControllerRepresentable {
    private let images: [UIImage]
    private let onCanceled: () -> Void
    private let onShared: () -> Void
    
    public init(images: [UIImage], onCanceled: @escaping () -> Void, success onShared: @escaping () -> Void) {
        self.images = images
        self.onCanceled = onCanceled
        self.onShared = onShared
    }

    public func makeUIViewController(context: Context) -> UIActivityViewController {
        let activityController = UIActivityViewController(activityItems: images, applicationActivities: nil)
        activityController.completionWithItemsHandler = {
            (activityType, completed, returnedItems, error) in
            if !completed {
                self.onCanceled()
                return
            }
            self.onShared()
        }
        return activityController
    }

    public func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {
    }
}

//struct UIActivityView_Previews: PreviewProvider {
//    static var previews: some View {
//        UIActivityView()
//    }
//}
