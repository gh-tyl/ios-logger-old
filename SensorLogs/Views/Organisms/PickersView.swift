import SwiftUI

struct PickersView: View {
    let titles = ["Activity", "Location"]
    
    var body: some View {
        VStack {
            ForEach(titles, id: \.self) { title in
                PickerSetView(title: title)
            }
        }
    }
}

struct PickersView_Previews: PreviewProvider {
    static var previews: some View {
        PickersView().previewLayout(.sizeThatFits)
    }
}
