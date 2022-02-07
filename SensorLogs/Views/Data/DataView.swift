import SwiftUI

struct DataView: View {
    @State private var sheetIsPresented = false
    let R = [UIImage(named: "tyl_kindle")!]
    
    
    var body: some View {
        VStack {
            Button(action: {
                self.sheetIsPresented = true
            }, label: { Text("show activity controller") })
        }
        .sheet(isPresented: $sheetIsPresented) {
            UIActivityView(images: R, onCanceled: {
                // on cancel
            }) {
                // on success
            }
        }
    }
}

struct DataView_Previews: PreviewProvider {
    static var previews: some View {
        DataView()
    }
}
