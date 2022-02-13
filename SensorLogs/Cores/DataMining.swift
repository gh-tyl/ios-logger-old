import Foundation
import CoreMotion
import SwiftUI

class LogsWriter {

    var file: FileHandle?

    func open(_ filePath: URL) {
        do {
            FileManager.default.createFile(atPath: filePath.path, contents: nil, attributes: nil)
            let file = try FileHandle(forWritingTo: filePath)
            var header = ""
            header += "datetime,"
            header += "atmospheric_pressure,"
            header += "abs_altitude,"
            header += "screen_brightness,"
            header += "\n"
            file.write(header.data(using: .utf8)!)
            self.file = file
        } catch let error {
            print(error)
        }
    }

    func write(_ logs: Dictionary<String, String>) {
        guard let file = self.file else { return }
        var text = ""
        text += "\(String(describing: logs["datetime"])),"
        text += "\(String(describing: logs["atmospheric_pressure"])),"
        text += "\(String(describing: logs["abs_altitude"])),"
        text += "\(String(describing: logs["screen_brightness"])),"
        text += "\n"
        file.write(text.data(using: .utf8)!)
    }

    func close() {
        guard let file = self.file else { return }
        file.closeFile()
        self.file = nil
    }
}

struct FileList: Hashable {
    var filepaths: String
    var filenames: String
}

func GetLogs(filepaths: [String], filenames: [String]) -> [FileList] {
    var filelist = [FileList(filepaths: "", filenames: "")]
    for (filepath, filename) in zip(filepaths, filenames) {
        filelist.append(FileList(filepaths: "\(filepath)", filenames: "\(filename)"))
    }
    filelist.removeFirst()
    return filelist
}
