import SwiftUI
import Combine
import CoreData
import CoreMotion

struct DataView: View {
//    @State private var sheetIsPresented = false
//    let R = [UIImage(named: "tyl_kindle")!]
    
    @State var filepaths = File.documentDirectory.filePaths
    @State var filenames = File.documentDirectory.fileNames
    
    var body: some View {
        NavigationView {
            List {
                ForEach(self.filenames, id: \.self) { item in
                    NavigationLink {
                        Text("\(item)")
                    } label: {
                        Text(item)
                    }
                }
                .onDelete(perform: self.deleteRow)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
            }
        }
        .onAppear(perform: {
            self.filepaths = File.documentDirectory.filePaths
            self.filenames = File.documentDirectory.fileNames
        })
    }
//        VStack {
//            Button(action: {
//                self.sheetIsPresented = true
//            })
//            {
//                Image(systemName: "square.and.arrow.up")
//
//            }
//        }
//        .sheet(isPresented: $sheetIsPresented) {
//            UIActivityView(images: R, onCanceled: {
//                // on cancel
//            }) {
//                // on success
//            }
//        }
//    }

//    private func addItem() {
//        withAnimation {
//            let newItem = Item(context: viewContext)
//            newItem.timestamp = Date()
//
//            do {
//                try viewContext.save()
//            } catch {
//                // Replace this implementation with code to handle the error appropriately.
//                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//                let nsError = error as NSError
//                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//            }
//        }
//    }

    func deleteRow(offsets: IndexSet) {
        withAnimation {
            self.filenames.remove(atOffsets: offsets)
            let delfile = File(path: filepaths[offsets.first!])
            try? delfile.delete()
            self.filepaths = File.documentDirectory.filePaths
            self.filenames = File.documentDirectory.fileNames
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
        DataView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
