import UIKit

// MARK: ファイルを抽象化した構造体を作る(1)

struct File {
    let path: String
}

extension File {
    
    static let documentDirectoryPath = NSSearchPathForDirectoriesInDomains(
        .documentDirectory,
        .userDomainMask,
        true
    ).first!
    
    static let libraryDirectoryPath = NSSearchPathForDirectoriesInDomains(
        .libraryDirectory,
        .userDomainMask,
        true
    ).first!
    
    static let temporaryDirectoryPath = NSTemporaryDirectory()
    
    static let mainBundlePath = Bundle.main.bundlePath
    
    static let documentDirectory = File(path: documentDirectoryPath)
    static let libraryDirectory = File(path: libraryDirectoryPath)
    static let temporaryDirectory = File(path: temporaryDirectoryPath)
    static let mainBundle = File(path: mainBundlePath)
}

extension File {
    
    func append(pathComponent: String) -> File {
        return File(path: (path as NSString).appendingPathComponent(pathComponent))
    }
    
    static func + (lhs: File, rhs: String) -> File {
        return lhs.append(pathComponent: rhs)
    }
}

extension File: Equatable {
    
    static func == (lhs: File, rhs: File) -> Bool {
        return lhs.path == rhs.path
    }
}

// MARK: ファイルを抽象化した構造体を作る(2)

extension File {
    
    var exists: Bool {
        return FileManager.default.fileExists(atPath: path)
    }
}

extension File {
    
    var parentDirectoryPath: String {
        if path == "/" { return "" }
        return (path as NSString).deletingLastPathComponent
    }
    
    var parentDirectory: File {
        return File(path: parentDirectoryPath)
    }
}

extension File {
    
    func makeDirectory() throws {
        if !exists {
            try FileManager.default.createDirectory(
                atPath: path,
                withIntermediateDirectories: true,
                attributes: nil
            )
        }
    }
}

// MARK: ファイルを抽象化した構造体を作る(3)

extension File {
    
    var url: URL {
        return URL(fileURLWithPath: path)
    }
    
    var data: Data? {
        return try? Data(contentsOf: url)
    }
}

extension File {
    
    func contents(encoding: String.Encoding) -> String? {
        guard let data = self.data else { return nil }
        return String(data: data, encoding: encoding)
    }
    
    var contents: String? {
        return contents(encoding: .utf8)
    }

    func write(contents: String, encoding: String.Encoding = .utf8) throws {
        try parentDirectory.makeDirectory()
        try contents.write(to: url, atomically: false, encoding: encoding)
    }
}

extension File {
    
    var image: UIImage? {
        guard let data = self.data else { return nil }
        return UIImage(data: data)
    }
    
    // JPEGで書き込む
    func write(imageAsJpeg image: UIImage, quality: CGFloat = 0.9) throws {
        guard let data = image.jpegData(compressionQuality: quality) else { return }
        try parentDirectory.makeDirectory()
        try data.write(to: url)
    }
    
    // PNGで書き込む
    func write(imageAsPng image: UIImage) throws {
        guard let data = image.pngData() else { return }
        try parentDirectory.makeDirectory()
        try data.write(to: url)
    }
}

// MARK: ファイルを抽象化した構造体を作る(4)

extension File {
    
    var name: String {
        return (path as NSString).lastPathComponent
    }
    
    var `extension`: String {
        let ext = (name as NSString).pathExtension
        return ext.isEmpty ? "" : ".\(ext)"
    }
    
    var extensionWithoutDot: String {
        let ext = (name as NSString).pathExtension
        return ext.isEmpty ? "" : "\(ext)"
    }
    
    var nameWithoutExtension: String {
        return (name as NSString).deletingPathExtension
    }
}

extension File {
    
    var isFile: Bool {
        var isDirectory: ObjCBool = false
        if FileManager.default.fileExists(atPath: path, isDirectory: &isDirectory) {
            return !isDirectory.boolValue
        }
        return false
    }
    
    var isDirectory: Bool {
        var isDirectory: ObjCBool = false
        if FileManager.default.fileExists(atPath: path, isDirectory: &isDirectory) {
            return isDirectory.boolValue
        }
        return false
    }

// こちらでも可
//  var isDirectory: Bool {
//      return exists && !isFile
//  }
}

// MARK: ファイルを抽象化した構造体を作る(5)

extension File {

    // 作成日時
    var creationDate: Date? {
        return attributes[.creationDate] as? Date
    }
    
    // 更新日時
    var modificationDate: Date? {
        return attributes[.modificationDate] as? Date
    }
    
    // ファイルサイズ
    var size: UInt64 {
        return attributes[.size] as? UInt64 ?? 0
    }
    
    private var attributes: [FileAttributeKey : Any] {
        let attr1 = (try? FileManager.default.attributesOfFileSystem(forPath: path)) ?? [:]
        let attr2 = (try? FileManager.default.attributesOfItem(atPath: path)) ?? [:]
        return [attr1, attr2].reduce(into: [FileAttributeKey : Any](), { ret, attr in
            ret.merge(attr) { $1 }
        })
    }
}

// MARK: ファイルを抽象化した構造体を作る(6)

extension File {

    var files: [File] {
        return filesMap { self + $0 }
    }
    
    var filePaths: [String] {
        return filesMap { (self + $0).path }
    }
    
    var fileNames: [String] {
        return filesMap { $0 }
    }
    
    private func filesMap<T>(_ transform: (String) throws -> (T)) rethrows -> [T] {
        guard let fileNames = try? FileManager.default.contentsOfDirectory(atPath: path) else {
            return []
        }
//        return try fileNames.map { try transform($0) }
//     ファイル名で並べたいときは下を使用する
        return try fileNames.sorted().map { try transform($0) }
    }
}

extension File: CustomStringConvertible {
    
    var description: String {
        let type = isDirectory ? "Dir" : "File"
        return "<\(type) \(name)>"
    }
}

// MARK: ファイルを抽象化した構造体を作る(7)

extension File {

    func delete() throws {
        try FileManager.default.removeItem(atPath: path)
    }
    
    func deleteAllChildren() throws {
        try files.forEach { file in
            try file.delete()
        }
    }
    
    func copy(to destination: File, force: Bool = true) throws {
        if force && destination.exists {
            try destination.delete()
        }
        try FileManager.default.copyItem(atPath: path, toPath: destination.path)
    }
    
     func move(to destination: File, force: Bool = true) throws {
        if force && destination.exists {
            try destination.delete()
        }
        try FileManager.default.moveItem(atPath: path, toPath: destination.path)
    }
    
    func rename(to name: String, force: Bool = true) throws -> File {
        let destination = File(path: parentDirectoryPath) + name
        try move(to: destination, force: force)
        return destination
    }
}

// MARK: ファイルを抽象化した構造体を作る(8)

extension File {
    
    func jsonDecoded<T>(_ type: T.Type) throws -> T? where T : Decodable {
        guard let data = self.data else { return nil }
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return try decoder.decode(type, from: data)
    }
}

extension File {
    
    func jsonEncode<T>(_ value: T) throws -> Data where T : Encodable {
        let encoder = JSONEncoder()
        encoder.outputFormatting = [.prettyPrinted, .sortedKeys]
        encoder.keyEncodingStrategy = .convertToSnakeCase
        return try encoder.encode(value)
    }
    
    func writeEncodedJson<T>(_ value: T, encoding: String.Encoding = .utf8) throws where T : Encodable {
        let encoded = try jsonEncode(value)
        let jsonString = String(data: encoded, encoding: encoding) ?? ""
        try parentDirectory.makeDirectory()
        try jsonString.write(to: url, atomically: false, encoding: encoding)
    }
}
