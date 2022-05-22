import SwiftUI

struct RecordView: View {
    var imgName: String = "record.circle"
    var imgColor: Color = .black
    var imgSize: CGFloat = 50.0
    
    var body: some View {
        VStack {
            Spacer()
            Button(action:
                    { print("start record") },
                   label:
                    { Image(systemName: imgName)
                    .foregroundColor(imgColor)
                    .font(.system(size: imgSize))
                }
            )
        }
    }
}

struct RecordView_Previews: PreviewProvider {
    static var previews: some View {
        RecordView().previewLayout(.sizeThatFits)
    }
}
