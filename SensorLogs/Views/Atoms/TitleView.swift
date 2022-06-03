import SwiftUI

struct TitleView: View {
    @State var title: String = ""
    
    var body: some View {
        let height: CGFloat = 2.0
        let bar_color: Color = .gray
        
        VStack {
            Text(title)
                .font(.title)
                .fontWeight(.medium)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
            Rectangle()
                .fill(bar_color)
                .frame(height: height)
                .padding(.horizontal)
        }
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView(title: "title").previewLayout(.sizeThatFits)
    }
}
