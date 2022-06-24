import SwiftUI

struct PickerView: View {
    @State var selection: Int = 0
    let data = ["0", "1", "2", "3", "4"]
    
    var body: some View {
        Picker(selection: $selection, label: Text("Picker")) {
            ForEach(data, id:\.self) { value in
                Text("\(value)")
                    .tag(value)
            }
        }
        .pickerStyle(.wheel)
    }
}

struct PickerView_Previews: PreviewProvider {
    static var previews: some View {
        PickerView().previewLayout(.sizeThatFits)
    }
}
