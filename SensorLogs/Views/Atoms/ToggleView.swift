import SwiftUI

struct ToggleView: View {
    @State private var isSet = false
    
    var body: some View {
        Toggle(isOn: $isSet) {
        }
        .labelsHidden()
        .padding()
    }
}

struct ToggleView_Previews: PreviewProvider {
    static var previews: some View {
        ToggleView().previewLayout(.sizeThatFits)
    }
}
