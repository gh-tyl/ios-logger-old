import SwiftUI
import Combine
import CoreData
import CoreMotion

struct DataView: View {
    @State private var sheetIsPresented = false
    
    @State var filepathlist = File.documentDirectory.filePaths
    @State var filenamelist = File.documentDirectory.fileNames
    @State var contents = ""
    @State private var selectedValue: Set<FileList> = []
    
    var body: some View {
        VStack(spacing: 30){
            NavigationView {
                List(selection: $selectedValue) {
                    ForEach(GetLogs(filepaths: filepathlist,
                                    filenames: filenamelist),
                            id: \.self)
                    { item in
                        NavigationLink {
//                            Text(File(path: item.filepaths).contents ?? "")
                            Text(contents)
                                .onAppear(perform: {
                                    self.contents = File(path: item.filepaths).contents  ?? ""
                                })
                        } label: {
                            Text("\(item.filenames)")
                        }
                    }
                    .onDelete(perform: self.deleteRow)
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        HStack(spacing: 30) {
                            Button(action: {
                                self.sheetIsPresented = true
                            })
                            {Image(systemName: "square.and.arrow.up")}
                            EditButton()
                        }
                    }
                }
            }
            .onAppear(perform: {
                self.filepathlist = File.documentDirectory.filePaths
                self.filenamelist = File.documentDirectory.fileNames
            })
        }
        .sheet(isPresented: $sheetIsPresented) {
            UIActivityView(fileurls: $selectedValue)
        }
    }
    func deleteRow(offsets: IndexSet) {
        withAnimation {
            self.filenamelist.remove(atOffsets: offsets)
            let delfile = File(path: filepathlist[offsets.first!])
            try? delfile.delete()
            self.filepathlist = File.documentDirectory.filePaths
            self.filenamelist = File.documentDirectory.fileNames
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct DataView_Previews: PreviewProvider {
    static var previews: some View {
        DataView()
    }
}
