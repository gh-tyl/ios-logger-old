import SwiftUI

class TimerModel: ObservableObject {
    var timer: Timer?
    @Published var lastUpdated: Date

    init() {
     lastUpdated = Date()
    }

    private let myDispatchQueue = DispatchQueue.main
    /// 実際のスタート処理
    func timerStart() {
         timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {
             _ in self.myDispatchQueue.async(){
             self.lastUpdated = Date()
             }
         }
    }
}

struct NotesView: View {
    @EnvironmentObject var cd: TimerModel

    private var dateFormatter: DateFormatter {
       let formatter = DateFormatter()
       formatter.timeStyle = .medium
       return formatter
    }

    var body: some View {
       VStack {
          Text("\(cd.lastUpdated, formatter: dateFormatter)")
          .font(Font.title.monospacedDigit())
       }
       .onAppear {
          self.cd.timerStart()
       }
    }
}

struct NotesView_Previews: PreviewProvider {
    static var previews: some View {
        NotesView()
    }
}
